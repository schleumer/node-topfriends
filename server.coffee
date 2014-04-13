#!/usr/bin/env coffee
express = require 'express'
app = express()
r = require './lib/r'
http = require 'http'
routes = require './routes'
path = require 'path'
mongoose = require 'mongoose'
facebook = require 'facebook-node-sdk'

i18n = require('i18n')
i18n.configure(
  locales: ['ptBR', 'en'],
  defaultLocale: 'ptBR',
  directory: __dirname + '/locales'
)
GLOBAL.t = i18n.__

GLOBAL.r = r
GLOBAL.config = r("/config")

routes = require("./config/routes")
mongoOpts =
  server:
    auto_reconnect: true

mongoose.connect "mongodb://localhost/test-boilerplate", mongoOpts
SessionStore = require("session-mongoose")(express)
cookieParser = express.cookieParser("123456")
store = new SessionStore(
  interval: 120000
  key: 'express.sid'
  connection: mongoose.connection
)

fbConf = r('/config/fb')
graphConf = fbConf.auth
GLOBAL.facebookConf = fbConf


app.configure "development", ->
  app.set "port", process.env.PORT or 3000
  app.set "views", path.join(__dirname, "views")
  app.set "view engine", "jade"
  app.set "view options",
    layout: false

  app.use cookieParser
  app.use express.session(
    store: store
    cookie:
      maxAge: (604800 * 100)
  )

  app.use facebook.middleware(graphConf)
  app.use i18n.init
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.json()
  app.use express.urlencoded()
  app.use express.methodOverride()
  app.use express.static(path.join(__dirname, "public"))
  app.use express.errorHandler()
  helpers = r("/lib/helpers")
  app.use helpers
  app.locals.pretty = true
  app.locals.basedir = config.viewsDir
  app.use app.router
  routes app

app.on "close", ->
  console.log "Closed"

server = http.createServer(app)
io = require('socket.io').listen(server, { log: false })

SessionSockets = require('session.socket.io')
sessionSockets = new SessionSockets(io, store, cookieParser)
sessionSockets.on('connection', (err, socket, session) ->
  console.log err
  require('./sockets/index')(socket, session, () ->
    socket.emit('session', session)
  )
  return
)


server.listen(3000)
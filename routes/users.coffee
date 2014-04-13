User = r("/models/user")
graph = require('fbgraph')
crypto = require("crypto")
ApiRes = r('/lib/jres')
request = require('request')
querystring = require 'querystring'


exports.login = (req, res) ->
  res.render "users/login"

exports.doLogin = (req, res) ->
  m = crypto.createHash("md5")
  m.update req.body.password
  pass = m.digest("hex")
  User.find
    username: req.body.username
    password: pass, (err, data) ->
      if data.length
        req.session.user = data[0].toObject()
        res.redirect "/"
      else
        res.redirect "/login"

exports.status = (req, res) ->
  jres = new ApiRes()
  req.facebook.setAccessToken(req.query.token)
  req.facebook.api('/me', (err, user) ->
    request.get("https://graph.facebook.com/oauth/access_token?grant_type=fb_exchange_token&client_id=#{facebookConf.auth.client_id}&client_secret=#{facebookConf.auth.client_secret}&fb_exchange_token=#{req.query.token}",
    (e, r, body) ->
      query = querystring.parse(body)
      console.log query
      if(query.access_token)
        req.facebook.api('/me/permissions', (err, permissions) ->
          user.permissions = permissions.data[0]
          jres.setData(user)
          req.session.facebookToken = query.access_token
          req.session.facebookUser = user
          res.json jres
        )
    )
  )

exports.logout = (req, res) ->
  jres = new ApiRes()
  jres.setData('ok')
  req.session.destroy()
  res.json(jres)

async = require 'async'

module.exports = (socket, session, next) ->
  async.waterfall([
    ((next) ->
      require('./topchat.coffee')(socket, session, next)
    )
  ], () ->
    next()
  )

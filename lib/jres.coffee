moment = require("moment")
_ = require("underscore")

module.exports = ->
  self = this
  @data = null
  @errors = []
  @messages = []
  @success = true
  @timestamp = null
  @setData = (data) ->
    self.data = data
    return

  @mergeData = (data) ->
    self.data = _.merge(@res.data, data)
    return

  @addError = (type, message) ->
    self.success = false
    self.errors.push
      type: type
      message: message
    return


  @addMessage = (type, message) ->
    self.messages.push
      type: type
      message: message
    return


  @get = ->
    self.timestamp = moment().unix()
    self.toObject()
  return this

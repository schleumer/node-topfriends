index = r("/routes/index")
templates = r('/routes/templates')

auth = r("/lib/auth")


module.exports = (app) ->
  app.get "/", auth, index
  app.get "/templates/*", templates.get

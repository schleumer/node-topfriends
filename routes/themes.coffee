exports.change = (req, res) ->
  req.session.theme = req.params.theme
  res.redirect '/'

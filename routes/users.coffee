User = r("/models/user")
graph = require('fbgraph')
crypto = require("crypto")
ApiRes = r('/lib/jres')


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
    jres.setData(user)
    req.session.facebookUser = user
    res.json jres
  )

module.exports = (req, res, next) ->
	res.locals.__p = (count, singular, plural, none) ->
		count = parseInt(count or 0)
		if count <= 0
			t none
		else if count is 1
			t singular
		else
			t plural

	next()

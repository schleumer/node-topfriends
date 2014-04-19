Facebook = require('facebook-node-sdk')
jlinq = require 'jlinq'
async = require 'async'
request = require 'request'

module.exports = (socket, session, next) ->
  socket.on('topchat:makeIt', (p) ->
    console.log(p)
    socket.emit('topchat:threads:status', 'aeHOOOOOOOO...')
  )
  socket.on('topchat:threads', () ->
    fb = new Facebook(facebookConf.auth);
    fb.setAccessToken session.facebookToken

    socket.emit('topchat:threads:status',
      t('Trocando idéia com o Facebook...'))
    async.waterfall([
      ((done) ->
        fb.api({
            method: 'fql.query',
            query: 'SELECT object_id, thread_id, subject, recipients, message_count, updated_time FROM thread WHERE folder_id = 0 ORDER BY message_count DESC'
          },
          ((err, response) ->
            if err
              console.log err
              done('O aplicativo não pode acessar seus dados no Facebook, tente sair e voltar.')
              return
            data = response
            done(null, data)
          )
        )
      ), ((data, done) ->
        socket.emit('topchat:threads:status', 'Procurando usuários...')
        me = session.facebookUser
        users = []
        _data = data
        data = []
        _data.forEach (t) ->
          if t.recipients.length > 2
            return
          t.recipients.forEach (tr) ->
            if users.indexOf(tr) == -1
              users.push(tr)
          data.push t
          return

        request.get('http://graph.facebook.com/?ids=' + users.join(','),
        (e, r, body) ->
          participants = JSON.parse(body)
          data.forEach (t) ->
            t.recipients.forEach (tr) ->
              if tr != me.id
                t.participant = participants[tr]

          done(null, data)
        )


      )
    ], (err, data) ->
      if err
        socket.emit('error', {
          message: err
        })
        return
      socket.emit('topchat:threads:status', false)
      socket.emit('topchat:threads:data', data)
    )


  )

  next(null);
  return
act = require "#{__dirname}/seneca/act"
app = require "#{__dirname}/app"

port = 80
version = process.env.PH_FRONTEND_V
server = app.listen port, (err)->
  if err
    console.log 'Error starting API server', err
  else
    log_opts =
      role: 'util'
      cmd: 'log'
      type: 'general'
      service: 'Frontend Server'
      message: "Frontend Server v#{version} started on port #{port}"
    act log_opts

module.exports = server

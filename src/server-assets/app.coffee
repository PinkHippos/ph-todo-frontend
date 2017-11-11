express = require 'express'
helmet = require 'helmet'
morgan = require 'morgan'

# Instantiate the express app
app = express()

# Log Requests to the server
app.use morgan 'dev'

# Protect ourselves
app.use helmet()
# Send only the client folder for requests to the server
app.use '/', express.static "#{__dirname}/../client"
app.use '/vendor/', express.static "#{__dirname}/../vendor"
# Export the app for use in the server
module.exports = app

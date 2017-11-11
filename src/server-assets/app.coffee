express = require 'express'
helmet = require 'helmet'
morgan = require 'morgan'

# Instantiate the express app
app = express()

# Log Requests to the server
app.use morgan 'dev'

# Protect ourselves
# app.use helmet()
vendor_static = express.static "#{__dirname}/../vendor"
client_static = express.static "#{__dirname}/../client"
# Send only the client & vendor folder for requests to the server
app.use '/vendor/', vendor_static
app.use '/', client_static
# app.use '/vendor', express.static "#{__dirname}/../vendor"
# Export the app for use in the server
module.exports = app

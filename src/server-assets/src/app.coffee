express = require 'express'
helmet = require 'helmet'
morgan = require 'morgan'

# Instantiate the express app
app = express()

# Log Requests to the server
app.use morgan 'dev'

# Protect ourselves
app.use helmet()

vendor_router = express.Router()
vendor_router.use express.static "#{__dirname}/../vendor"

client_router = express.Router()
client_router.use express.static "#{__dirname}/../../react-client/build"
# Send only the client & vendor folder for requests to the server
# app.use '/vendor/', vendor_router
app.use '/', client_router

# Export the app for use in the server
module.exports = app

express = require 'express'
mongoose = require 'mongoose'


# --------------------------------------------------------------- Setup database
database_url = process.env.MONGOHQ_URL
mongoose.connect(database_url)

db = mongoose.connection

db.on 'error', ->
  console.log "Error connecting to database"

db.once 'open', ->
  console.log "Database: OK"

# ------------------------------------------------------------- Configure server
app = express()

app.set 'view engine', 'jade'
app.set 'views', './views'
app.use express.static './public'

# --------------------------------------------------------------- Add all routes
(require './routes/books') app
(require './routes/edit') app
(require './routes/') app


# ---------------------------------------------------------------------[ START ]
port = process.env.PORT or 6000
app.listen port, ->
  console.log "Listening on port #{port}, mongo db is at #{database_url}"

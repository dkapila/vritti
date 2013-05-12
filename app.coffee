express  = require 'express'
app = express()

port = process.env.PORT or 6000

app.get '/', (req, res) ->
    res.send 'Vritti says "Hello, World!"'

app.listen port, ->
    console.log "Listening on port #{port}"

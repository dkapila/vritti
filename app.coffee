express  = require 'express'
app = express()

app.configure ->
    app.set "port", process.env.PORT or 5000

app.get '/', (req, res) ->
    res.send 'Vritti says "Hello, World!"'

app.listen app.get('port'), ->
    console.log "Listening on port #{app.get('port')}"

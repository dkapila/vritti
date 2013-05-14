express = require 'express'
mongodb = require 'mongodb'

connection_url = process.env.MONGOHQ_URL

app = express()

port = process.env.PORT or 6000

app.get '/', (req, res) ->
  mongodb.Db.connect connection_url, (error, client) ->
    throw error if error
    bookdb = new mongodb.Collection(client, 'books')
    books = bookdb.find({}, limit: 10)
    res.send "Vritti says MongoDB has #{books.count} books"

app.listen port, ->
  console.log "Listening on port #{port}, mongo db is at #{connection_url}"

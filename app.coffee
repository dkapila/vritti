express = require 'express'
mongodb = require 'mongodb'

connection_url = process.env.MONGOHQ_URL

app = express()

port = process.env.PORT or 6000

app.get '/', (req, res) ->
  response = 'Welcome to Vritti<br/>'
  mongodb.Db.connect connection_url, (error, client) ->
    throw error if error
    bookdb = new mongodb.Collection(client, 'books')
    books = bookdb.find({}, limit: 10)
    books.toArray (error, thebooks) ->
      throw error if error
      for book in thebooks
        response += "Vritti says MongoDB has #{book.title}<br/>"

    res.send(response)
    client.close()

app.listen port, ->
  console.log "Listening on port #{port}, mongo db is at #{connection_url}"

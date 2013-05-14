express = require 'express'
mongodb = require 'mongodb'

connection_url = process.env.MONGOHQ_URL

app = express()

port = process.env.PORT or 6000

app.get '/books/all', (req, res) ->
  response = 'Welcome to Vritti<br/>'
  mongodb.Db.connect connection_url, (error, client) ->
    throw error if error
    bookdb = new mongodb.Collection(client, 'books')
    books = bookdb.find({}, limit: 10)
    books.toArray (error, thebooks) ->
      throw error if error
      for book in thebooks
        response += "Vritti says we have #{book.title} with #{book.lastpage} pages<br/>"
        response += "Its first page is here<br/>"
        response += "<img src='http://http://vrittiscans.s3-website-eu-west-1.amazonaws.com/#{book._id}/00001.#{book.imagetype}'/>"
      res.send(response)
      client.close()

app.listen port, ->
  console.log "Listening on port #{port}, mongo db is at #{connection_url}"

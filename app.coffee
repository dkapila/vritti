express = require 'express'
mongoose = require 'mongoose'

database_url = process.env.MONGOHQ_URL
mongoose.connect(database_url)

book =
  _id: String
  added: Date
  title: String
  localizedtitle: String
  imagetype: String
  lastpage: Number

bookSchema = mongoose.Schema book
Books = mongoose.model 'Books', bookSchema

db = mongoose.connection

db.on 'error', ->
  console.log "Error connecting to database"

db.once 'open', ->
  console.log "Database: OK"

app = express()

app.get '/', (req, res) ->
  response = 'Welcome to Vritti<br/>'
  Books.find (error, books) ->
    throw error if error
    console.log "Found some books"
    for book in books
      console.log "One book found #{book.title}"
      response += "Found book #{book.title} with #{book.lastpage} pages<br/>"
      response += "Its first page is: <br/>"
      response += "<img src='http://vrittiscans.s3-website-eu-west-1.amazonaws.com/#{book._id}/00001.#{book.imagetype}' height='300px'/>"
    res.send(response)

port = process.env.PORT or 6000
app.listen port, ->
  console.log "Listening on port #{port}, mongo db is at #{database_url}"

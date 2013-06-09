# /routes/books/index.coffee
models = require '../../models'

module.exports = (app) ->
  app.get '/books', (req, res) ->
    models.Book.find (error, books) ->
      res.render 'books/', { books: books }

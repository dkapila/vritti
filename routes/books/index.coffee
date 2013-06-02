# /routes/books/index.coffee
models = require '../../models'

module.exports = (req, res) ->
  models.Book.find (error, books) ->
    res.render 'books', { books: books }


mongoose = require 'mongoose'

book =
  _id: String
  added: Date
  title: String
  localizedtitle: String
  imagetype: String
  lastpage: Number

bookSchema = mongoose.Schema book
Book = mongoose.model 'Book', bookSchema

module.exports = Book

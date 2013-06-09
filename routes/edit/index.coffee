# This route is used to show a scanned page to be edited

logic = require '../../logic.coffee'

module.exports = (app) ->
  app.get '/edit', (req, res) ->
    pageNumber = parseInt req.query.page, 10 # convert string to int base 10

    if (isNaN pageNumber) or (pageNumber < 1) then res.send 404, 'Page not found'

    scannedpage = logic.getScannedPageURL req.query.bookID, pageNumber
    nextpage    = "/edit?bookID=#{req.query.bookID}&page=#{pageNumber+1}"
    prevpage    = "/edit?bookID=#{req.query.bookID}&page=#{pageNumber-1}"

    res.render 'edit/', { imageURL: scannedpage, nextURL: nextpage, prevURL: prevpage }

# Some app logic

baseURL = 'http://vrittiscans.s3-website-eu-west-1.amazonaws.com/'

exports.getScannedPageURL = (bookID, pageNumber) ->
  # assume gif format
  return baseURL + bookID + '/' + pageNumber + '.gif'


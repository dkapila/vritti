module.exports = (app) ->
  app.get '/', (req, res) ->
    res.render 'index', { title: "Vritti - Home" }

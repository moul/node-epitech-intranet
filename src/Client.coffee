models = require './models'

class module.exports.Client
  constructor: (@opts = {}) ->
    @opts.login ?= ''
    @opts.url   ?= 'https://intra.epitech.bigint.fr/intra/'
    @models = {}
    do @initModels
    return @

  initModel: (cls) =>
    model = new cls @
    do model.setupRoutes
    do model.attach
    return model

  initModels: => @models[k] = @initModel v for k, v of models

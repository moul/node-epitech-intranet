class module.exports.Model
  constructor: (@client) ->
    @globalRoutes = {}
    @localRoutes =  {}

  setupRoutes: =>

  attach: =>
    @client.__defineGetter__ k, (-> v) for k, v of @globalRoutes
    @.__defineGetter__       k, (-> v) for k, v of @localRoutes

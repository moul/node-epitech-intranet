class module.exports.Model
  constructor: (@client) ->
    @globalRoutes = {}
    @localRoutes =  {}

  setupRoutes: => # placeholder

  debug: (args...) -> console.log args...

  request: (path, fn) =>
    @debug "Calling #{path}"
    @client.request path, fn

  attach: =>
    @client.__defineGetter__ k, (-> v) for k, v of @globalRoutes
    @.__defineGetter__       k, (-> v) for k, v of @localRoutes

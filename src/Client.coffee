models = require './models'

class module.exports.Client
  constructor: (@opts = {}) ->
    do @defaultOptions
    do @parseOptions
    do @initModels
    return @

  defaultOptions: =>
    @opts.login ?= ''
    @opts.url   ?= 'https://intra.epitech.bigint.fr/intra/'

  parseOptions: =>
    if @opts.url?
      @opts[k] ?= v for k, v of require('url').parse @opts.url
    @opts.protocol ?= 'https:' if @opts.ssl?
    @opts.host ?= @opts.hostname
    host = @opts.host.split ':'
    @opts.hostname ?=   host[0]
    @opts.port ?=       host[1]
    @opts.username ?=   'admin'
    @opts.protocol ?=   'http:'
    @opts.port ?=       if @opts.protocol is 'https:' then 443 else 80
    @opts.port =        parseInt @opts.port
    @opts.path ?=       '/'
    @opts.pathname ?=   @opts.path
    @opts.host =        "#{@opts.hostname}:#{@opts.port}"
    @opts.verbose ?=    false
    @http =             if @opts.protocol is 'https:' then require 'https' else require 'http'
    delete @opts.href
    delete @opts.url
    delete @opts.slashes
    delete @opts.auth

  initModel: (cls) =>
    model = new cls @
    do model.setupRoutes
    do model.attach
    return model

  initModels: =>
    @models = {}
    @models[k] = @initModel v for k, v of models

  debug: (args) =>
    if @opts.verbose
      console.log args

  authRequired: (fn) =>
    # TODO: check auth

  parseRequest: (buffer, fn) =>
    json = JSON.parse buffer.split('\n')[1...].join('\n')
    fn false, json

  fetchRequest: (args = {}, fn) =>
    fullPath = "#{@opts.path}#{args.path}?format=json"
    @debug "Fullpath: #{fullPath}"
    reqOpts =
      host:   @opts.hostname
      port:   @opts.port
      method: args.method || 'GET'
      path:   fullPath
      headers:
        Host: @opts.hostname
    req = @http.request reqOpts
    req.on 'error', (err) -> fn err, {}
    req.end()
    req.on 'response', (response) ->
      buffer = ''
      response.on 'data', (chunk) -> buffer += chunk
      response.on 'end', ->
        switch response.statusCode
          when 401 then fn {"code": "AUTH REQUIRED"}, buffer
          when 200 then fn null, buffer if fn
          else          fn {"code": "BADSTATUSCODE", "message": response.statusCode}, buffer

  request: (args = {}, fn) =>
    if typeof(args) is 'string'
      args = path: args
    @fetchRequest args, (err, buffer) =>
      return fn err, buffer if err
      @parseRequest buffer, (err, object) =>
        return fn err, object

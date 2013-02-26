{Model} = require '../Model'

class module.exports.User extends Model
  setupRoutes: =>
    @globalRoutes['user'] = @router
    @router.index = @index

  index: (fn) => @request "user/", fn

  router: (fn = null) =>
    switch typeof(fn)
      when 'function'
        return @index fn
      when 'string'
        ue = @client.initModel module.exports.UserEntity
        ue.login = fn
        return ue

class module.exports.UserEntity extends Model
  setupRoutes: =>
    @netsoul = {}
    @netsoul.getlog = @netsoul_getlog

  netsoul_getlog: (fn) => @request "user/#{@login}/netsoul/getlog/", fn

  index: (fn) => @request "user/#{@login}/", fn

  # https://intra.epitech.bigint.fr/intra/user/touron_m/binome?format=json
  # "user(#{@login}).binome"
  binome: (fn) => @request "user/#{@login}/binome", (err, result) ->
    return fn err, result if err
    return fn err, result, result.binomes

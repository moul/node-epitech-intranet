{Model} = require '../Model'

class module.exports.User extends Model
  setupRoutes: =>
    @globalRoutes['user'] = @router
    @router.index = @index

  index: (fn) => fn false, 'user.index'

  router: (fn = null) =>
    switch typeof(fn)
      when 'function'
        return @index fn
      when 'string'
        ue = @client.initModel module.exports.UserEntity
        ue.login = fn
        return ue

class module.exports.UserEntity extends Model
  index: (fn) => fn false, "user(#{@login})"

  #https://intra.epitech.bigint.fr/intra/user/touron_m/binome?format=json
  binome: (fn) => fn false, "user(#{@login}).binome"


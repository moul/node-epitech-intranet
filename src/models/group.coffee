{Model} = require '../Model'

class module.exports.Group extends Model
  setupRoutes: =>
    @globalRoutes['group'] = @router

  router: (fn = null) =>
    switch typeof(fn)
      when 'function'
        return @index fn
      when 'string', 'number'
        ue = @client.initModel module.exports.GroupEntity
        ue.group = fn
        return ue
  index: (fn) =>    fn {"Method does not exists"}, {}

class module.exports.GroupEntity extends Model
  index: (fn) =>    @request "group/#{@group}/", fn

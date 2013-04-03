{Model} = require '../Model'

class module.exports.Module extends Model
  setupRoutes: =>
    @globalRoutes['module'] = @router

  router: (fn = null) =>
    switch typeof(fn)
      when 'function'
        return @index fn
      when 'string', 'number'
        ue = @client.initModel module.exports.ModuleEntity
        ue.module = fn
        return ue
  index: (fn) =>    fn {"Method does not exists"}, {}

class module.exports.ModuleEntity extends Model
  index: (fn) =>    @request "module/#{@module}/", fn

{Model} = require '../Model'

class module.exports.Index extends Model
  setupRoutes: =>
    @globalRoutes['index'] = @index

  index: (fn) => @request "", fn

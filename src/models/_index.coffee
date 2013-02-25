{Model} = require '../Model'

class module.exports.Index extends Model
  setupRoutes: =>
    @globalRoutes['index'] = @index

  index: (fn) => fn false, 'index'

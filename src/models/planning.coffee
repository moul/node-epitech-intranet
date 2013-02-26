{Model} = require '../Model'

class module.exports.Planning extends Model
  setupRoutes: =>
    @router =
      calendar: @calendar
      load:     @load
    @globalRoutes['planning'] = @router

  calendar: (fn) => @request "planning/calendar/", fn
  load: (fn)     => @request "planning/load/", fn

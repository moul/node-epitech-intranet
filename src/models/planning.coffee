{Model} = require '../Model'

class module.exports.Planning extends Model
  setupRoutes: =>
    @router.calendar = @calendar
    @router.load =     @load
    @globalRoutes['planning'] = @router

  router: (fn = null) =>
    switch typeof(fn)
      when 'function'
        return @index fn
      when 'string', 'number'
        ue = @client.initModel module.exports.PlanningEntity
        ue.planning = fn
        return ue
  index: (fn) =>    fn {"Method does not exists"}, {}
  calendar: (fn) => @request "planning/calendar/", fn
  load: (fn) =>     @request "planning/load/", fn

class module.exports.PlanningEntity extends Model
  index: (fn) =>    @request "planning/#{@planning}/", fn
  events: (fn) =>   @request "planning/#{@planning}/events/", fn

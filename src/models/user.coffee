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
    @netsoul =
      getlog:  @netsoul_getlog
    @notification =
      coming:  @notification_coming
      message: @notification_message
      alert:   @notification_alert

  netsoul_getlog: (fn) =>       @request "user/#{@login}/netsoul/getlog/", fn
  notification_coming: (fn) =>  @request "user/#{@login}/notification/coming/", fn
  notification_message: (fn) => @request "user/#{@login}/notification/message/", fn
  notification_alert: (fn) =>   @request "user/#{@login}/notification/alert/", fn
  index: (fn) =>                @request "user/#{@login}/", fn
  binome: (fn) =>               @request "user/#{@login}/binome", (err, result) ->
    return fn err, result if err
    return fn err, result, result.binomes

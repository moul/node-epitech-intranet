{Model} = require '../Model'

class module.exports.User extends Model
  setupRoutes: =>
    @globalRoutes['user'] = @router
    @router.index =    @index
    @router.complete = @complete
    @router.filter =
      course:   @filter_course
      promo:    @filter_promo
      year:     @filter_year
      filtered: @filter_filtered
      prefered: @filter_prefered
      user:     @filter_user

  index: (fn) => @request "user/", fn

  complete: (args = {}, fn) =>
    args.path = "user/complete/"
    @request args, fn

  # TODO: example
  filter_course: (args = {}, fn) =>
    args.path = "user/filter/course/"
    @request args, fn
  filter_promo: (args = {}, fn) =>
    args.path = "user/filter/promo/"
    @request args, fn
  filter_year: (args = {}, fn) =>
    args.path = "user/filter/year/"
    @request args, fn
  filter_filtered: (args = {}, fn) =>
    args.path = "user/filter/filtered/"
    @request args, fn
  filter_prefered: (args = {}, fn) =>
    args.path = "user/filter/prefered/"
    @request args, fn
  filter_user: (args = {}, fn) =>
    args.path = "user/filter/user/"
    @request args, (err, result) ->
      return fn err, result if err
      return fn err, result.items, result

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
  alive: (fn) =>                @request "user/#{@login}/alive/", fn
  binome: (fn) =>               @request "user/#{@login}/binome", (err, result) ->
    return fn err, result if err
    return fn err, result.binomes, result

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

{Client} = require '..'

client = new Client
  verbose: false

paths = [
  "client"
  "client.index"
  "client.user"
  "client.user.index"
  "client.user('touron_m')"
  "client.user('touron_m').index"
  "client.user('touron_m').binome"
  "client.user('touron_m').netsoul"
  "client.user('touron_m').netsoul.getlog"
  "client.user('touron_m').notification"
  "client.user('touron_m').notification.coming"
  "client.user('touron_m').notification.message"
  "client.user('touron_m').notification.alert"
  "client.planning"
  "client.planning.load"
  "client.planning.calendar"
  "client.planning(2)"
  "client.planning(2).events"
  "client.group('Paris')"
  "client.group('Paris').index"
  "client.module(2012)"
  "client.module(2012).index"
  #"client.module(2012)('B-WEB-275')"
  #"client.module(2012)('B-WEB-275').index"
  #"client.module(2012)('B-CUI-150')('NAN-2-1')"
  #"client.module(2012)('B-CUI-150')('NAN-2-1').index"
  #"client.planning(2)(754)"
  ]

for _path in paths
  do ->
    path = _path
    obj = eval path
    if typeof(obj) is 'function'
      try
        obj (err, data) ->
          data = unless client.opts.verbose then "data.length=#{data.length}" else unless err then "data=#{data}" else data
          console.log "[+] path=#{path}, err=", err, data
      catch e
        console.log "[-] path=#{path}, err=", e
    else
      console.error "[-] path=#{path} is not a function"

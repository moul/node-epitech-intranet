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
  ]

for _path in paths
  do ->
    path = _path
    obj = eval path
    if typeof(obj) is 'function'
      obj (err, data) ->
        data = unless client.opts.verbose then "data.length=#{data.length}" else unless err then "data=#{data}" else data
        console.log "[+] path=#{path}, err=", err, data
    else
      console.error "[-] path=#{path} is not a function"

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

{Client} = require '..'

client = new Client
  verbose: true

paths = [
  "client"
  "client.index"
  "client.user"
  "client.user.index"
  "client.user('touron_m')"
  "client.user('touron_m').index"
  "client.user('touron_m').binome"
  ]

for path in paths
  obj = eval path
  if typeof(obj) is 'function'
    obj (err, data) -> console.log "[+] path=#{path}, err=#{err}, data=#{data}"
  else
    console.error "[-] path=#{path} is not a function"

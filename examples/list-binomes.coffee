# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

{Client} = require '..'

client = new Client
  verbose: true

client.user('touron_m').binome (err, data, binomes) ->
  return console.log err, data, binomes if err
  console.log [binome.login for binome in binomes][0].join ', '

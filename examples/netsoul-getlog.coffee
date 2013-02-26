# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

{Client} = require '..'

client = new Client
  verbose: true

client.user('touron_m').netsoul.getlog (err, logs) ->
  return console.log err, logs if err
  for log in logs
    console.log log

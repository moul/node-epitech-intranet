# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

{Client} = require '..'

client = new Client
  verbose: true

client.user.complete { search: 'touron' }, (err, entries) ->
  return console.log err, results if err
  for entry in entries
    console.log entry

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

{Client} = require '..'

client = new Client
  verbose: true

search_filters =
  #location: 'FR/BDX|FR/LIL|FR/LYN|FR/MAR|FR/MPL|FR/NCY|FR/NAN|FR/NCE|FR/PAR|FR/REN|FR/STG|FR/TLS'
  location: 'FR/PAR'
  year:     '2011'
  active:   false
  offset:   0

client.user.filter.user search_filters, (err, items, result) ->
  return console.log err, items if err
  console.log "Displaying: #{items.length} / #{result.total}"
  for item in items
    console.log item.login

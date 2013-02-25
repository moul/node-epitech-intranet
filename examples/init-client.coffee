{Client} = require '..'

client = new Client
  login:      'touron_m'
  password:   'xxxxx'
  url:        'https://intra.epitech.bigint.fr/intra/'
  auth_token: 'xxxxx-xxxxx-xxxxx-xxxxx'
  verbose:    true

console.log client

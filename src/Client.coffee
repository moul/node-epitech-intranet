class Client
  constructor: (@opts = {}) ->
    @opts.login ?= ''
    @opts.url   ?= 'https://intra.epitech.bigint.fr/intra/'

module.exports =
  Client: Client

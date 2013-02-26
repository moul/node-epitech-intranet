fs = require 'fs'

models = ['_index', 'user', 'planning', 'group']

module.exports = []
for model in models
  for k, v of require "./#{model}"
    module.exports[k] = v

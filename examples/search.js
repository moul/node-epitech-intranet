// Generated by CoffeeScript 1.5.0
(function() {
  var Client, client;

  process.stdout.write('\u001B[2J\u001B[0;0f');

  Client = require('..').Client;

  client = new Client({
    verbose: true
  });

  client.user.complete({
    search: 'touron'
  }, function(err, entries) {
    var entry, _i, _len, _results;
    if (err) {
      return console.log(err, results);
    }
    _results = [];
    for (_i = 0, _len = entries.length; _i < _len; _i++) {
      entry = entries[_i];
      _results.push(console.log(entry));
    }
    return _results;
  });

}).call(this);

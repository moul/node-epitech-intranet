// Generated by CoffeeScript 1.4.0
(function() {
  var Client, client, paths, _fn, _i, _len, _path;

  process.stdout.write('\u001B[2J\u001B[0;0f');

  Client = require('..').Client;

  client = new Client({
    verbose: false
  });

  paths = ["client", "client.index", "client.user", "client.user.index", "client.user('touron_m')", "client.user('touron_m').index", "client.user('touron_m').binome", "client.user('touron_m').netsoul", "client.user('touron_m').netsoul.getlog", "client.user('touron_m').notification", "client.user('touron_m').notification.coming", "client.user('touron_m').notification.message", "client.user('touron_m').notification.alert", "client.planning", "client.planning.load", "client.planning.calendar", "client.planning(2)", "client.planning(2).events"];

  _fn = function() {
    var obj, path;
    path = _path;
    obj = eval(path);
    if (typeof obj === 'function') {
      return obj(function(err, data) {
        data = !client.opts.verbose ? "data.length=" + data.length : !err ? "data=" + data : data;
        return console.log("[+] path=" + path + ", err=", err, data);
      });
    } else {
      return console.error("[-] path=" + path + " is not a function");
    }
  };
  for (_i = 0, _len = paths.length; _i < _len; _i++) {
    _path = paths[_i];
    _fn();
  }

}).call(this);

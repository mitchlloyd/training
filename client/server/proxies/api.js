var Proxy = require('http-proxy');
var path = require('path');

// For options, see:
// https://github.com/nodejitsu/node-http-proxy
var proxy = Proxy.createProxyServer({});

var proxyPath = '/training/api';

module.exports = function(app) {

  app.use(proxyPath, function(req, res, next){
    // include root path in proxied request
    req.url = path.join(proxyPath, req.url);
    proxy.web(req, res, { target: 'http://127.0.0.1:3000' });
  })

};

local Pegasus = require 'pegasus'

local server = Pegasus:new()

server:start(function(req, rep)
  local html = table.concat({ 
    '<!doctype html>',
    '<html>',
    '<head>',
    '<title></title>',
    '</head>',
    '<body><img src="http://localhost:8080/video/"></body>',
    '</html>'
  }, '')

  rep:write(html)
end)

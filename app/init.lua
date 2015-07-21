local Pegasus = require 'pegasus'
local Camera = require 'app/camera'

local camera = Camera:new()
local server = Pegasus:new()

local videoFeed = function(req, rep)
  local isIndex = string.find(req.path, '/') ~= nil

  if isIndex then
    print('index')
    rep:addHeader('Content-Type', 'text/html'):write('<img src="http://localhost:9090/video-feed/">')
    return nil
  end

  print('video-feed')
  rep:addHeader('Content-Type', 'multipart/x-mixed-replace; boundary=frame')

  for i=1, 3 do
    local frame = Camera:getFrame(i)
    local src = table.concat({
      '--frame\r\n',
      'Content-Type: image/jpeg\r\n\r\n' .. frame .. '\r\n'
    }, '')
    
    rep:write(src, true)
  end
end

server:start(videoFeed)

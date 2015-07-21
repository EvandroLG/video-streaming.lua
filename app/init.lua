local Pegasus = require 'pegasus'
local Camera = require 'app/camera'

local camera = Camera:new()
local server = Pegasus:new()
local server = Pegasus:new({
  port = '9090',
  location = '/app/'
})

local videoFeed = function(req, rep)
  local isImage = string.find(req.path, 'images') ~= nil
  if isImage then return nil end

  rep:addHeader('Content-Type', 'multipart/x-mixed-replace; boundary=frame')

  for i=1, 3 do
    local frame = Camera:getFrame(i)
    local src = table.concat({
      '--frame\r\n',
      'Content-Type: image/jpeg\r\n\r\n' .. frame .. '\r\n'
    }, '')
    
    rep:write('<img src"' .. src .. '">', true)
  end
end

server:start(videoFeed)

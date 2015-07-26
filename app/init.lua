local Pegasus = require 'pegasus'
local Camera = require 'app/camera'

local Jiray = {}

function Jiray:new(params)
  local obj = {}
  self.__index = self
  self.dir = params.dir
  self.camera = Camera:new(dir)
  self.server = Pegasus:new({
    port = params.port
  })

  return setmetatable(obj, self)
end

function Jiray:start()
  self.server:start(function(req, rep)
    local isVideo = string.find(req.path, '/video/') ~= nil
    if not isVideo then return nil end

    rep:addHeader('Content-Type', 'multipart/x-mixed-replace; boundary=frame')

    local i = 1

    while Camera:getFrame(i) ~= nil do
      local frame = Camera:getFrame(i)
      i = i + 1
      local src = table.concat({
        '--frame\r\n',
        'Content-Type: image/jpeg\r\n\r\n' .. frame .. '\r\n'
      }, '')
      
      rep:write(src, true)
    end
  end)
end

return Jiray

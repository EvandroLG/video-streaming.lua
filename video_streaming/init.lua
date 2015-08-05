local Pegasus = require 'pegasus'
local Camera = require 'video_streaming.camera'
local socket = require 'socket'

local Streaming = {}

function Streaming:new(params)
  local obj = {}
  self.__index = self
  self.camera = Camera:new(params.dir or './')
  self.server = Pegasus:new({
    port = params.port or '9090'
  })

  return setmetatable(obj, self)
end

function Streaming:start()
  self.server:start(function(req, rep)
    local isVideo = string.find(req.path or '', '/video_streaming/') ~= nil
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

return Streaming

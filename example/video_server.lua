local Streaming = require 'video_streaming.init'

local serverVideo = Streaming:new({
  port='8080',
  dir='example/images/'
})

serverVideo:start()

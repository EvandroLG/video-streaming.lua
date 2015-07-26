local Streaming = require 'app/init'

local serverVideo = Streaming:new({
  port='8080',
  dir='example/images/'
})

serverVideo:start()

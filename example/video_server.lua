local Jiray = require 'app/init'

local serverVideo = Jiray:new({
  port='8080',
  dir='example/images/'
})

serverVideo:start()

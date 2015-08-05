local lfs = require 'lfs'
local mimetypes = require 'mimetypes'

local Camera = {}

function Camera:new(dir)
  local obj = {}
  self.__index = self
  self.dir = dir

  return setmetatable(obj, self)
end

function Camera:_getFrames()
  self.frames = {}

  for fname in lfs.dir(self.dir) do
    if mimetypes.guess(fname) == 'image/jpeg' then 
      local file = io.open(self.dir .. fname, 'rb')
      table.insert(self.frames, file:read('*all'))
    end
  end 

  return self.frames
end

function Camera:getFrame(index)
  if not self.frames then
    self:_getFrames()
  end

  return self.frames[index]
end

return Camera

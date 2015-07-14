local Camera = {}

function Camera:new()
  local obj = {}
  self.__index = self

  return setmetatable(obj, self)
end

function Camera:_getFrames()
  if self.frames then return end

  self.frames = {}

  for x=1, 3 do
    local filename = 'images/' .. x .. '.jpg'
    local file = io.open(filename, 'rb')

    self.frames.insert(file:read('*all'))
  end

  return self.frames
end

function Camera:getFrame()
  self:_getFrames()
  return self.frames
end

return Camera

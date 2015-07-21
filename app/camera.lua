local Camera = {}

function Camera:new()
  local obj = {}
  self.__index = self

  return setmetatable(obj, self)
end

function Camera:_getFrames()
  self.frames = {}

  for x=1, 3 do
    local filename = 'app/images/' .. x .. '.jpg'
    local file = io.open(filename, 'rb')
    table.insert(self.frames, file:read('*all'))
  end

  return self.frames
end

function Camera:getFrame(index)
  if not self.frames then
    self:_getFrames()
  end
  print(self.frames[index])
  return self.frames[index]
end

return Camera

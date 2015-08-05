local Camera = require 'video_streaming.camera'

function tableLength(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end

  return count
end

describe('camera', function()
  
  function verifyMethod(method)
    assert.equal(type(Camera[method]), 'function')
  end

  it('should exists camera class', function()
    assert.equal(type(Camera), 'table') 
  end)    

  it('should exists new method', function()
    verifyMethod('new')
  end)

  it('should exists _getFrames method', function()
    verifyMethod('_getFrames')
  end)

  it('should exists getFrames method', function()
    verifyMethod('getFrame')
  end)

  it('should exists a dir variable with the same value passed by parameter', function()
    local camera = Camera:new('images/')
    assert.equal(camera.dir, 'images/')
  end)

  it('should create a table with the binary files', function()
    local camera = Camera:new('spec/fixtures/')
    camera:_getFrames()

    assert.equal(type(camera.frames), 'table')
    assert.equal(tableLength(camera.frames), 3)
    for key, value in pairs(camera.frames) do  assert(type(value), 'string') end
  end)

  it('should return the binary frame passed by parameter', function()
    local camera = Camera:new('spec/fixtures/')
    camera:_getFrames()

    for key, value in pairs(camera.frames) do
      assert.equal(camera:getFrame(key), value)
    end
  end)

end)

local Streaming = require 'video_streaming.init'

describe('streaming', function()
  function verifyMethod(method)
    assert.equal(type(Streaming[method]), 'function')
  end

  it('should exists streaming class', function()
    assert.equal(type(Streaming), 'table')
  end)

  it('should exists new method', function()
    verifyMethod('new') 
  end)

  it('should exists start method', function()
    verifyMethod('start') 
  end)

  it('should instantiete the camera class passing dir as parameter', function()
  end)

  it('should instantiete the pegasus passing port as parameter', function()
  end)

  it('should delivery video by /video_streaming/', function()
  end)
end)

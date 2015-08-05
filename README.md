# VideoStreaming.lua
Library that implements [MontionJPG](https://en.wikipedia.org/wiki/Motion_JPEG) technique using Lua and [Pegasus.lua](http://evandrolg.github.io/pegasus.lua)

## Installation
To install video_streaming, run:
```sh
$ luarocks install video_streaming 
```

## How to use it?
You need to create a instance of Streaming, pass a port and a path to the directory where the images will served:

```lua
local Streaming = require 'video_streaming.init'

local serverVideo = Streaming:new({
  port='8080',
  dir='images/'
})

serverVideo:start()
```

Then you will have a localhost server delivering through the path /video_streaming/ 

## Contributing

### Install Dependencies

```sh
$ make install_dependencies
```

### Running tests

```sh
$ make test
```


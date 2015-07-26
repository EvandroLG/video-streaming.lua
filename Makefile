.SILENT:

run_example:
	lua example/video_server.lua&
	lua example/server.lua

test:
	busted test.lua

install_dependencies:
	luarocks install pegasus
	luarocks install busted

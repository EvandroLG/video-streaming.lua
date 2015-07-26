.SILENT:

run_example:
	lua example/video_server.lua&
	lua example/server.lua

test:
	busted

install_dependencies:
	luarocks install pegasus
	luarocks install busted

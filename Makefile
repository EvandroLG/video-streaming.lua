.SILENT:

run:
	lua app/test.lua

test:
	busted test.lua

install_dependencies:
	luarocks install pegasus
	luarocks install busted

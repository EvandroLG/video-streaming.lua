.SILENT:

run:
	lua app/init.lua

test:
	busted test.lua

install_dependencies:
	luarocks install pegasus
	luarocks install busted

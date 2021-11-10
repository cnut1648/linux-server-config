# linux-server-config
Server setup

Set up dotfiles on Ubuntu server without `apt-get`

After running `init`

# Lua
Needed by ranger z-lua plugins

1. Download src from https://www.lua.org/manual/5.4/readme.html (e.g. `wget http://www.lua.org/ftp/lua-5.4.3.tar.gz`)
2. unzip
3. in top level, `make linux`
4. in `src`, have `lua` (interpreter), `luac` (compiler) and `liblua.a` (library)

# Conda

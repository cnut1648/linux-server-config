# linux-server-config
Server setup

Set up dotfiles on Ubuntu server without `apt-get`


1. install latest tar

```sh
wget https://ftp.gnu.org/gnu/tar/tar-latest.tar.gz;
tar xvfz tar-*.tar.gz;
cd tar-*/;
# last step might need sudo, or configure --prefix=local_path
./configure && make && make install
# move binary
mv ./tar-1.34/src/tar .
```

After running `init`

# Lua
Needed by ranger z-lua plugins

1. Download src from https://www.lua.org/manual/5.4/readme.html (e.g. `wget http://www.lua.org/ftp/lua-5.4.3.tar.gz`)
2. unzip
3. in top level, `make linux`
4. in `src`, have `lua` (interpreter), `luac` (compiler) and `liblua.a` (library)

# Conda
download `x86_64` script from [here](https://repo.continuum.io/miniconda/)

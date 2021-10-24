#! /bin/bash
mkdir ~/.config;
mkdir ~/tools;
# git repo dir
cur=$( pwd )
cd ~/tools;

# dust for better du
# from https://github.com/bootandy/dust/releases
URL='https://github.com/bootandy/dust/releases/download/v0.7.5/dust-v0.7.5-x86_64-unknown-linux-gnu.tar.gz';
wget $URL -O ./pkg.tar.gz;
# unzip to `pkg`
tar -xvf pkg.tar.gz --one-top-level=pkg --strip-components 1;
rm ./pkg.tar.gz;
mv pkg/dust . && rm -rf ./pkg;


# mcfly for better C-r
# from https://github.com/cantino/mcfly/releases
URL='https://github.com/cantino/mcfly/releases/download/v0.5.9/mcfly-v0.5.9-x86_64-unknown-linux-musl.tar.gz'
wget $URL -O ./pkg.tar.gz;
# unzip to `pkg`
tar -xvf pkg.tar.gz --one-top-level=mcfly --strip-components 1;
rm ./pkg.tar.gz;

# delta for better diff
# from https://github.com/dandavison/delta#installation
URL='https://github.com/dandavison/delta/releases/download/0.8.3/delta-0.8.3-x86_64-unknown-linux-gnu.tar.gz';
wget $URL -O ./pkg.tar.gz;
# unzip to `pkg`
tar -xvf pkg.tar.gz --one-top-level=pkg --strip-components 1;
rm ./pkg.tar.gz;
mv pkg/delta . && rm -rf ./pkg;

# lsd for better ls
# from https://github.com/Peltoche/lsd/releases
URL='https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-0.20.1-x86_64-unknown-linux-musl.tar.gz'
wget $URL -O ./pkg.tar.gz;
# unzip to `pkg`
tar -xvf pkg.tar.gz --one-top-level=pkg --strip-components 1;
rm ./pkg.tar.gz;
mv pkg/lsd . && rm -rf ./pkg;

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv ./nvim.appimage ./nvim
mkdir ~/.config/nvim;
cp init.vim ~/.config/nvim/init.vim



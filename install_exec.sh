#! /bin/bash

####################
# github
####################
git config --global credential.helper store
git config --global user.name "jiashu"
git config --global user.email "jiashuxu@usc.edu"
cp ~/.gitconfig ~

####################
# tmux
####################
git clone https://github.com/gpakosz/.tmux.git
cp .tmux/.tmux.conf ~
cp .tmux/.tmux.conf.local ~
rm -rf .tmux

####################
# tools
####################


# create if not exist
[ -d ~/.config ] || mkdir ~/.config;
[ -d ~/tools ] || mkdir ~/tools;
# git repo dir
repo=$( pwd )
cd ~/tools;

cp $repo/args.py .

# dust for better du
# from https://github.com/bootandy/dust/releases
URL='https://github.com/bootandy/dust/releases/download/v0.7.5/dust-v0.7.5-x86_64-unknown-linux-gnu.tar.gz';
wget $URL;
tar -xvzf dust-*.tar.gz;
mv dust-*/dust .;
rm -rf dust-*

# mcfly for better C-r
# from https://github.com/cantino/mcfly/releases
URL='https://github.com/cantino/mcfly/releases/download/v0.5.9/mcfly-v0.5.9-x86_64-unknown-linux-musl.tar.gz'
wget $URL;
tar -xvzf mcfly-*.tar.gz;
mv mcfly-*/mcfly .;
rm -rf mcfly-*

# ripgrep for better grep
# from https://github.com/BurntSushi/ripgrep/releases
URL='https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz'
wget $URL;
tar -xvzf ripgrep-*.tar.gz;
mv ripgrep-*/rg .;
rm -rf ripgrep-*

# delta for better diff
# from https://github.com/dandavison/delta#installation
URL='https://github.com/dandavison/delta/releases/download/0.8.3/delta-0.8.3-x86_64-unknown-linux-gnu.tar.gz';
wget $URL;
tar -xvzf delta-*.tar.gz;
mv delta-*/delta .;
rm -rf delta-*

# fzf
# from https://github.com/junegunn/fzf/releases
URL='https://github.com/junegunn/fzf/releases/download/0.27.3/fzf-0.27.3-linux_amd64.tar.gz';
wget $URL;
tar -xvzf fzf-*.tar.gz;
mv fzf-*/fzf .;
rm -rf fzf-*

# lsd for better ls
# from https://github.com/Peltoche/lsd/releases
URL='https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-0.20.1-x86_64-unknown-linux-musl.tar.gz'
wget $URL;
tar -xvzf lsd-*.tar.gz;
mv lsd-*/lsd .;
rm -rf lsd-*

# zoxide
URL='https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.1/zoxide-0.9.1-x86_64-unknown-linux-musl.tar.gz'
wget $URL;
mkdir zoxide_unzip;
tar -xvzf zoxide-*.tar.gz -C zoxide_unzip;
mv zoxide_unzip/zoxide .;
rm -rf zoxide_unzip zoxide-*.tar.gz;

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv ./nvim.appimage ./nvim

# ranger
# installed in pip.sh
rm -rf ~/.config/ranger; mkdir ~/.config/ranger;
cp -rf $repo/dotfiles/ranger/* ~/.config/ranger/;

# permission to all binaries
chmod u+x *;

####################
# zsh
####################

cp $repo/.bashrc ~;
# reinit conda
~/miniconda3/bin/conda init bash;
#! /bin/bash
# create if not exist
[ -d ~/.config ] || mkdir ~/.config;
[ -d ~/tools ] || mkdir ~/tools;
# git repo dir
repo=$( pwd )
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
tar -xvf pkg.tar.gz --one-top-level=mcfly --strip-components 1;
rm ./pkg.tar.gz;

# ripgrep for better grep
# from https://github.com/BurntSushi/ripgrep/releases
URL='https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz'
wget $URL -O ./pkg.tar.gz;
tar -xvf pkg.tar.gz --one-top-level=pkg --strip-components 1;
rm ./pkg.tar.gz;
mv pkg/rg . && rm -rf ./pkg;

# delta for better diff
# from https://github.com/dandavison/delta#installation
URL='https://github.com/dandavison/delta/releases/download/0.8.3/delta-0.8.3-x86_64-unknown-linux-gnu.tar.gz';
wget $URL -O ./pkg.tar.gz;
tar -xvf pkg.tar.gz --one-top-level=pkg --strip-components 1;
rm ./pkg.tar.gz;
mv pkg/delta . && rm -rf ./pkg;

# fzf
# from https://github.com/junegunn/fzf/releases
URL='https://github.com/junegunn/fzf/releases/download/0.27.3/fzf-0.27.3-linux_amd64.tar.gz';
wget $URL -O ./pkg.tar.gz;
tar -xvf pkg.tar.gz --one-top-level=fzf --strip-components 1;
rm ./pkg.tar.gz;

# lsd for better ls
# from https://github.com/Peltoche/lsd/releases
URL='https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-0.20.1-x86_64-unknown-linux-musl.tar.gz'
wget $URL -O ./pkg.tar.gz;
tar -xvf pkg.tar.gz --one-top-level=pkg --strip-components 1;
rm ./pkg.tar.gz;
mv pkg/lsd . && rm -rf ./pkg;

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv ./nvim.appimage ./nvim
[ -d ~/.config/nvim ] || mkdir ~/.config/nvim && cp $repo/dotfiles/nvim/init.vim ~/.config/nvim;
if [ ! -d ~/.config/nvim/plugged ]; then
       # install plugins if not installed already
       mkdir ~/.config/nvim;
       sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';
       # run :PlugInstall in nvim
fi

# ranger
# installed in pip.sh
rm -rf ~/.config/ranger; mkdir ~/.config/ranger;
cp -rf $repo/dotfiles/ranger/* ~/.config/ranger/;

cp $repo/.bashrc ~;
cp $repo/.zshrc ~;
# reinit conda
~/miniconda3/bin/conda init bash;
# permission to all binaries
chmod u+x *;

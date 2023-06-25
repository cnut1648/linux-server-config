# linux-server-config
Server setup

Set up dotfiles on Ubuntu server without `apt-get`. In fact since it does not require `sudo` permission, it can be run on any remote server e.g. Amazon Linux on AWS.

1. Install miniconda from [Step 5. item 4](https://github.com/cnut1648/dotfiles/tree/master#step-5).

2. (optional) install latest tar

    ```sh
    wget https://ftp.gnu.org/gnu/tar/tar-latest.tar.gz;
    tar xvfz tar-*.tar.gz;
    cd tar-*/;
    # last step might need sudo, or configure --prefix=local_path
    ./configure && make && make install
    # move binary
    mv ./tar-1.34/src/tar .
    ```

    This will make it easier to unzip downloaded packages later.

3. Install executables via `./install_exec.sh`. These binaries are stored in `~/tools`.

   **Note**
   If the system does not have FUSE you can extract the appimage:
   ```shell
   cd ~/tools;
   ./nvim --appimage-extract
   rm ./nvim
   ln -s ./squashfs-root/usr/bin/nvim .
   # do not delete squashfs-root, it is needed by nvim
   ```

4. Copy `.bashrc` and `.zshrc` to `~/`. Then install oh-my-zsh according to [Step 5. item 3](https://github.com/cnut1648/dotfiles/tree/master#step-5).
   
   Optionally, to make use of [`delta`](https://github.com/dandavison/delta) in `git diff`, you can copy `.gitconfig` to `~/` as well.
   
   **Note**
   On AWS to change default shell, you need to
   ```shell
   sudo yum install util-linux-user
   sudo chsh -s $(which zsh) $(whoami)
   # in vscode you might need to Ctrl+Shift+P then `Terminal: Select Default Profile`
   ```
   
   *  Sometimes you need to automate `zsh` by the following in bash:

      ```shell
      # install oh-my-zsh
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      # install p10k
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
      echo ZSH_THEME="powerlevel10k/powerlevel10k" >> ~/.zshrc
      echo source $ZSH/oh-my-zsh.sh >> ~/.zshrc
      # if p10k not prompt automatically, use `p10k configure`
      exec zsh

      # install custom plugins from the hyperlink above
      # ...
      cp .zshrc ~
      ```

5. Runing `./pip.sh` to install useful commands via `pip`.

6. If you need a good nvim config, refer to [my nvim setup](https://github.com/cnut1648/nvim-lua.git)
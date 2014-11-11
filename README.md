dotfiles
========

Online repository of my configuration files.


Installation
------------

To install all dotfiles (as symbolic links to the cloned repo), run:

    ./install.sh

To install a subset, give the names as arguments to the install script:

    ./install.sh vimrc bashrc

### Vundle installation ###

The `vim` setup depends on Vundle. To set up Vundle:

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

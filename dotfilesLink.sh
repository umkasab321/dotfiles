#!/bin/sh
echo ".vimrcのリンクを作成します。"
ln -sf ~/setup/dotfiles/.vimrc ~/.vimrc
echo "ホームディレクトリに移動します。"
cd ~
echo ".vimディレクトリを作成します。"
if [! -e ~/.vim ]; then
    mkdir .vim
fi
echo "pluginディレクトリのリンクを作成します。"
ln -sf ~/setup/dotfiles/plugin ~/.vim/plugin

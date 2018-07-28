#!/bin/sh
echo ".vimrcのリンクを作成します。"
ln -sf ~/dotfiles/.vimrc ~/.vimrc
echo ".bashrcのリンクを作成します。"
ln -sf ~/dotfiles/.bashrc ~/.bashrc
echo "ホームディレクトリに移動します。"
cd ~
echo ".vimディレクトリを作成します。"
if [ ! -e ~/.vim ]; then
    mkdir .vim
fi

echo "日本語のホームディレクトリ下のディレクトリ名を英語に変更します(デスクトップ->Desktop)。"
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

#./bashrc ./profileのバックアップを作る
echo ".bashrcと.profileのバックアップを生成"
cp ~/.bashrc ~/.bashrc_back
cp ~/.profile ~/.profile_back

#./bashrcに各種エイリアス類を追加
echo "各種エイリアス設定を行います"
echo "alias ls='ls -a --color=auto' #lsで常にドットファイルも表示と色付き" >> ~/.bashrc
echo "alias rm='rm -i' #rmに確認させる" >> ~/.bashrc
echo -e "cl(){\n    cd \$1;\n    ls ;\n}" >> ~/.bashrc
echo "alias cd='cl' " >> ~/.bashrc

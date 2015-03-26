echo "日本語のホームディレクトリ下のディレクトリ名を英語に変更します(デスクトップ->Desktop)。"
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update


#ノーチラスのアドレスバーをボタン式からテキスト式に変える
echo "Nautilusのアドレスバーをボタン式からテキスト式に変更します。"
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

#.xmodmap生成
echo "Xmodmapでキーバインドの再マッピングを行います。"
echo "./xmodmapを作成します。"
echo -e "!\n! Caps_Lock->Ctrl\n!\nremove Lock = Caps_Lock\nkeysym Caps_Lock = Control_L\nadd Control = Control_L\n\n!Muhenkan -> Ctrl\nkeysym Muhenkan = Control_L\nadd Control =Control_L\n\n!Henkan_mode -> esc\nkeycode 100 = Escape\n\nclear Lock\n" >> ~/.Xmodmap
#./bashrc ./profileのバックアップを作る
echo ".bashrcと.profileのバックアップを生成"
cp ~/.bashrc ~/.bashrc_back
cp ~/.profile ~/.profile_back
#xmodmap ./xmodmapを.bashrcに追加
echo "コマンドxmodmap ./xmodmapの重複実行を回避します。"
echo "コマンドxmodmap ./xmodmapを~/.bashrcに追加します。"
echo -e "if [ ! \"\`xmodmap -pke | grep 'keycode 100 = Escape'\`\" ]\nthen\n    xmodmap ~/.Xmodmap\nfi" >> ~/.bashrc



#./bashrcに各種エイリアス類を追加
echo "各種エイリアス設定を行います"
echo "alias ls='ls -a --color=auto' #lsで常にドットファイルも表示と色付き" >> ~/.bashrc
echo "alias rm='rm -i' #rmに確認させる" >> ~/.bashrc
echo "alias python='python3' #pythonインタプリタを3に" >> ~/.bashrc
echo -e "cl(){\n    cd \$1;\n    ls ;\n}" >> ~/.bashrc
echo "alias cd='cl' " >> ~/.bashrc

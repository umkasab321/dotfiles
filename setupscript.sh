#./bashrcに各種エイリアス類を追加
echo "各種エイリアス設定を行います"
echo "alias ls='ls -a --color=auto' #lsで常にドットファイルも表示と色付き" >> ~/.bashrc
echo "alias rm='rm -i' #rmに確認させる" >> ~/.bashrc
echo -e "cl(){\n    cd \$1;\n    ls ;\n}" >> ~/.bashrc
echo "alias cd='cl' " >> ~/.bashrc

#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python36 python36-devel
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

# Enable the go modules feature
export GO111MODULE=on
# Set the GOPROXY environment variable
export GOPROXY=https://goproxy.io

sudo easy_install -ZU autopep8

if [ -f /usr/local/bin/ctags ] then
  mv /usr/local/bin/ctags /usr/bin/ctags
fi 

mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/GitSoftwareNow/vim-setting-and-plugins.git
mv -f ~/.vim ~/.vim_old

mv -f ~/vim-setting-and-plugins/vim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "正在努力为您安装bundle程序" > ma6174
echo "安装完毕将自动退出" >> ma6174
echo "请耐心等待" >> ma6174
vim ma6174 -c "BundleInstall" -c "q" -c "q"
rm ma6174
echo "安装完成"

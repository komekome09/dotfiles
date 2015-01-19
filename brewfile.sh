#!/bin/sh

# brew が存在するかの確認
if ! brew --version then
	echo "homebrew is not installed."
	echo "Are you want to install homebrew? [Y/N]"
	read ans
	case $ans in
		[nN]) echo "ok, bye."
			exit ;;
	esac
fi

# 何はともあれアップデート
brew update
brew upgrade

# brew-cask
brew install brew-cask

# 必要パッケージのインストール
brew install zsh
brew install git
brew install tmux
brew install vim --devel --with-lua
brew install minicom
brew install doxygen
brew install clisp
brew install qt
brew install wget

# 必要なもの cask版
brew cask install iterm2
brew cask install google-chrome
brew cask install dropbox
brew cask install 1password
brew cask install clipmenu
brew cask install evernote
brew cask install tunnelblick
brew cask install caffeine
brew cask install gimp
brew cask install sublime-text
brew cask install limechat
brew cask install skype
brew cask install thunderbird
brew cask install vls
brew cask install yorufukurou
brew cask install xquartz
brew cask install wireshark
brew cask install the-unarchiver
brew cask install steam


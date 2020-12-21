#!/bin/sh

# 何はともあれアップデート
brew update
brew upgrade

# install cask and mas
brew install cask
brew install mas

# 必要パッケージのインストール
#brew install clisp
#brew install doxygen
brew install git
brew install lua
#brew install minicom
#brew install npm
#brew install qt
brew install tmux
brew install vim --HEAD --with-lua
#brew install wget
brew install zsh
brew install vim
brew install tree


# 必要なもの cask版
#brew cask install caffeine
#brew cask install clipmenu
#brew cask install dropbox
#brew cask install evernote
#brew cask install gimp
#brew cask install google-chrome
#brew cask install google-japanese-ime
brew cask install iterm2
#brew cask install limechat
#brew cask install skype
#brew cask install steam
#brew cask install sublime-text
brew cask install the-unarchiver
#brew cask install thunderbird
#brew cask install tunnelblick
brew cask install vlc
#brew cask install wireshark
#brew cask install xquartz
#brew cask install yorufukurou
brew cask install firefox
brew cask install visual-studio-code
brew cask install appcleaner
brew cask install onedrive
brew cask install slack
brew cask install notion
brew cask install alfred
brew cask install docker

# mas
mas install 490461369 # BandWidth+
mas install 836505650 # Battery Monitor

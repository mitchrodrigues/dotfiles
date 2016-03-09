#!/bin/sh

# Check for Homebrew
if test ! $(which brew)
then
  echo "\n==> Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew update

# Install homebrew packages
brew install autojump
brew install bash-completion
brew install cmake
brew install ctags
brew install git
brew install node
brew install the_silver_searcher
brew install unrar
brew install vim
brew install lame
brew install sox -with--lame
brew install libogg
brew install libpng
brew install opus
brew install opus-tools
brew install ffmpeg
brew install wget
brew install mariadb
brew install memcached
brew install imagemagick
brew install libxml2
brew install redis
brew install gpg

brew cask install dropbox
brew cask install evernote
brew cask install iterm2
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
brew cask install hipchat
brew cask install sequel-pro
brew cask install screenhero


brew cleanup

exit 0

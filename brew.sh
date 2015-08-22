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
brew install ansible
brew install cmake
brew install ctags
brew install git
brew install node
brew install rbenv
brew install the_silver_searcher
brew install ruby-build
brew install unrar
brew install vim

# Install brew-cask & packages
brew tap phinze/homebrew-cask
brew install brew-cask

brew cask install 1password
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

brew cleanup

exit 0

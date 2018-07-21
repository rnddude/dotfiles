#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh

# Install other useful binaries.
brew install htop
brew install nmap
brew install bash-completion
brew install git
brew install git-lfs
brew install ssh-copy-id
brew install tree
brew install pcre
brew install jq
brew install lftp
brew install ack
brew install unrar
brew install findutils

# Install docker
brew install docker
brew install docker-machine
brew install docker-compose

# Install cask
brew install cask
brew cask install atom
brew cask install sublime
brew cask install evernote
brew cask install skitch
brew cask install google-chrome
brew cask install keepassx
brew cask install the-unarchiver
brew cask install virtualbox

# Remove outdated versions from the cellar.
brew cleanup

# Check
brew doctor
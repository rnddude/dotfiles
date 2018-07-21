#!/usr/bin/env bash

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

# Install cask
brew install cask
brew cask install sublime
brew cask install the-unarchiver
brew cask install virtualbox

# Remove outdated versions from the cellar.
brew cleanup		
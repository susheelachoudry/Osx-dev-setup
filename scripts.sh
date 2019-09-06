#!/usr/bin/env bash

# This script will install few packages automatically. 
# Download the file
# open terminal, Go to the path
# run sh scripts.sh

echo ##################################################################################
#checking if brew available if not install it
IS_BREW_AVAILABLE=brew help | grep 'command not found'
[[ ! -z "$IS_BREW_AVAILABLE" ]] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
unset IS_BREW_AVAILABLE
echo ##################################################################################


echo ##################################################################################
# "Removing node if any available in the system, Don't worry we will reinstall it again with nvm."
#  "nvm will manage node better than us."
if test  $(which node); then
brew uninstall node --ignore-dependencies
fi
echo ##################################################################################


echo ##################################################################################
# "Installing nvm, node package manager"
if ! test $(nvm --version); then
brew install nvm
fi
echo ##################################################################################


echo ##################################################################################
echo "Installing node via nvm"
nvm install node
echo ##################################################################################


echo ##################################################################################
echo "which node version we have"
which node
# if you want some other version please use nvm use versionWhichYouWant,,,,,,  if it is not available in your system, install it by using nvm install node versionWhichYouWant.
echo ##################################################################################

echo ##################################################################################
# "Installing nvm, node package manager"
if ! test $(yarn --version); then
brew install nvm
fi
echo ##################################################################################


echo ##################################################################################
# "Installing yarn, package manager"
IS_YARN_AVAILABLE=yarn -v
[[ -z "IS_YARN_AVAILABLE"]] && brew install yarn
echo ##################################################################################


echo ##################################################################################
# "Installing sourcetree, if you are a command line person, remove below line and run the script." 
IS_SOURCETREE_AVAILABLE=brew cask list | grep 'sourcetree'
[[ ! -z "$IS_SOURCETREE_AVAILABLE"]] && brew cask install sourcetree
echo ##################################################################################


echo ##################################################################################
echo "Installing vscode"
IS_VISUAL_STUDIO_AVAILABLE=brew cask list | grep 'visual-studio-code'
[[ ! -z "$IS_VISUAL_STUDIO_AVAILABLE"]] && brew cask install visual-studio-code
echo ##################################################################################

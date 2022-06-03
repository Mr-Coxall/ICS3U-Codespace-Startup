#!/bin/bash

# Created by: Mr Coxall
# Created on: Jun 2022
# Created for: To automate the generation of SSH GitHub keys


# this script will setup your SSH key with GitHub
echo "This script will setup your SSH key with GitHub"
echo ""

echo "Please enter your full name (ex: Jane Smith): "
read  name
echo "Please enter your email address that you used to setup GitHub (ex: mr.coxall@mths.ca): "
read  email
echo "Please enter your GitHub user name (ex: mr-coxall): "
read  user

echo ""
echo "You will next be asked 3 questions."
echo "Just press ENTER each time."
echo ""

# setup SSH key
ssh-keygen -t ed25519 -C "$email"
ssh-add ~/.ssh/id_ed25519
echo ""
cat ~/.ssh/id_ed25519.pub

echo ""
echo "Please copy and paste the above key into your GitHub SSH Keys."
echo "(at: https://github.com/settings/keys)"
echo "Once done, press any key."
read  any_key

echo ""
echo "Next you will be asked if you want to continue"
echo "Type 'yes' ..."
echo "Once done, press any key."
read  any_key

ssh -T git@github.com
git config --global user.email "$email"
git config --global user.name "$name"
git config --global init.defaultBranch main

echo ""
echo "To finish the setup, a new Codespace window will open up."
echo "When it does, close this orginial one and use the new Codespace window."
echo "When ready, press any key."
read  any_key

# create an ICS3U directory in the root directory
mkdir ~/ICS3U

# copy over the .vscode directory into it
cp -r .vscode ~/ICS3U/.vscode

# update the .bashrc to add in aliases for ll, ..
cp .bashrc ~/.bashrc

# change into the ICS3U directory and then open Codespaces in there
cd ~/ICS3U
code .

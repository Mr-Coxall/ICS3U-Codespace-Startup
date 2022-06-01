#!/bin/bash

# Created by: Mr Coxall
# Created on: Jun 2022
# Created for: To automate the generation of SSH GitHub keys

# install CPPLint
pip3 install cpplint


# this script will setup your SSH key with GitHub
echo "This script will setup your SSH key with GitHub"
echo ""

echo "Please enter your full name (ex: Jane Smith): \c "
read  name
echo "Please enter your email address that you used to setup GitHub (ex: mr.coxall@mths.ca): \c "
read  email
echo "Please enter your GitHub user name (ex: mr-coxall): \c "
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
echo "Once done, press any key."
read  any_key

echo ""
echo "You will be asked if you want to continue."
echo "Type yes."
echo ""
echo "After doing this a new Codespace window will open."
echo "Close this window and use the new one."
#read  any_key

ssh -T git@github.com
git config --global user.email "$email"
git config --global user.name "$name"
git config --global init.defaultBranch main

cd ~
code .

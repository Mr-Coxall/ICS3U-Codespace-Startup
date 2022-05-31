#!/bin/bash

# Created by: Mr Coxall
# Created on: Jun 2022
# Created for: To automate the generation of SSH GitHub keys

# this script will setup your SSH key with GitHub
echo "This script will setup your SSH key with GitHub"
echo ""

echo -e "Please enter your full name (ex: Jane Smith): \c "
read  name
echo -e "Please enter your email address that you used to setup GitHub (ex: mr.coxall@mths.ca): \c "
read  email
echo -e "Please enter your GitHub user name (ex: mr-coxall): \c "
read  user

echo -e ""
echo -e "You will next be asked 3 questions."
echo -e "Just press ENTER each time."
echo -e ""

# setup SSH key
ssh-keygen -t ed25519 -C "$email"
ssh-add ~/.ssh/id_ed25519
echo ""
cat ~/.ssh/id_ed25519.pub

echo ""
echo "Please copy and paste the above key into your GitHub SSH Keys: \c "
echo -e "Once done, press any key. \c "
read  any_key

ssh -T git@github.com
git config --global user.email "$email"
git config --global user.name "$name"

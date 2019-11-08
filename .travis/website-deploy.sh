#!/usr/bin/env bash

export SSH_DIR=$PWD/.travis
export SITE_DIR=$PWD/dita-draft-website

# install SSH key
eval "$(ssh-agent -s)"
chmod 600 $PWD/.travis/dita-draft-website_rsa
ssh-add $PWD/.travis/dita-draft-website_rsa

cd $SITE_DIR

# Reset files where only commit metadata has changed
#ruby ../.travis/clean.rb
# commit site
git config user.email "jarno@elovirta.com"
git config user.name "Jarno Elovirta"
# Add (stage) all untracked & modified files and remove all missing files
git add --all
# Commit generated site output
git commit -a -m "Deploy jelovirt/dita@${TRAVIS_COMMIT:0:7} to 'dev' docs"
# push
git remote set-url origin git@github.com:jelovirt/dita-draft-website.git
git push -v origin master

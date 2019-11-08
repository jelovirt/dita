#!/bin/bash

set -e

# install SSH key
openssl aes-256-cbc -K $encrypted_1cdec9caab2b_key -iv $encrypted_1cdec9caab2b_iv -in $PWD/.travis/dita-draft-website_rsa.enc -out $PWD/.travis/dita-draft-website_rsa -d
eval "$(ssh-agent -s)"
chmod 600 $PWD/.travis/dita-draft-website_rsa
ssh-add $PWD/.travis/dita-draft-website_rsa

# Install DITA-OT
curl -sfL https://github.com/dita-ot/dita-ot/releases/download/$DITA_OT_VERSION/dita-ot-$DITA_OT_VERSION.zip -o dita-ot-$DITA_OT_VERSION.zip
unzip dita-ot-$DITA_OT_VERSION.zip
export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION

# Install site plugin
curl -L https://github.com/dita-ot/org.dita-ot.html/archive/master.zip -o org.dita-ot.html.zip
$DITA_HOME/bin/dita --install org.dita-ot.html.zip -v

# Clone site
git clone -b master git@github.com:jelovirt/dita-draft-website.git

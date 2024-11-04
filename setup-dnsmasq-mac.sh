#!/bin/bash

set -e

# Setup DNS
echo "Please put in your mac admin password if the question is asked."
echo "This script installs dnsmasq and configures to so that *.lndo.site resolve to localhost without using"
echo "the dns from the internet."
brew install --quiet dnsmasq
[ ! -d /etc/resolver ] && sudo mkdir /etc/resolver
cat <<EOF | sudo tee /etc/resolver/lndo.site
nameserver 127.0.0.1
EOF

cat <<EOF > /tmp/lando.conf
address=/lndo.site/127.0.0.1
EOF
[ -d /usr/local/etc/dnsmasq.d ] && cp /tmp/lando.conf /usr/local/etc/dnsmasq.d
[ -d /opt/homebrew/etc/dnsmasq.d ] && cp /tmp/lando.conf /opt/homebrew/etc/dnsmasq.d
rm /tmp/lando.conf

sudo brew services start dnsmasq > /dev/null || sudo brew services restart dnsmasq

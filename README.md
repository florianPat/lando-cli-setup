# Setup Lando

This repo is the single source of truth for all things relating to the installation and setup of (flos) Lando.

This currently includes:

* WSL2/POSIX setup scripts
* Install docs

## Ok great, how do I get going now??

### macOS/linux/wsl2

1. Install docker desktop if you are on mac (e.g. with `brew install --cask docker-desktop`) or install docker engine if you are on wsl/linux
2. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/florianPat/lando-cli-setup/main/setup-lando.sh)"`

### If the "*.lndo.site" domains do not resolve (e.g. due to fritzbox rebind protection), install dnsmasq:

Just run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/florianPat/lando-cli-setup/main/setup-dnsmasq-mac.sh)"`
This just automates the [setup process](https://docs.lando.dev/guides/offline-dev.html#mac-specific-instructions)
See [this](https://docs.lando.dev/help/dns-rebind.html) for more information

### You are using colima as your container runtime?
Just export the following env var before running the setup script:
`export COLIMA_INSTALL=1`

### You are using lando recipies and need all the plugins?

Just run `lando setup`, it will install the plugins automatically.

### You want to use your 1Password SSH Agent with lando?

Just install the plugin. See instructions [here](https://bitbucket.org/hdnet/1password-docker-ssh-agent/src/main/hdnet-lando-plugin/README.md) please.

## Maintainers

- [florianPat](https://github.com/florianPat), as long as the pull request is not merged ;)

# Setup Lando

This repo is the single source of truth for all things relating to the installation and setup of (flos) Lando.

This currently includes:

* WSL2/POSIX setup scripts
* Install docs

## Ok great, how do I get going now??

### macOS/linux/wsl2

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/florianPat/lando-cli-setup/main/setup-lando.sh)"`

### If I type in ```lando update``` one cannot update the core as it is "installed from source"

Just run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/florianPat/lando-cli-setup/main/update-flos-core.sh)"`

### If the "*.lndo.site" domains do not resolve (e.g. due to fritzbox rebind protection), install dnsmasq:

Just run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/florianPat/lando-cli-setup/main/setup-dnsmasq-mac.sh)"`
This just automates the [setup process](https://docs.lando.dev/guides/offline-dev.html#mac-specific-instructions)
See [this](https://docs.lando.dev/help/dns-rebind.html) for more information

## Maintainers

- [florianPat](https://github.com/florianPat), as long as the pull request is not merged ;)

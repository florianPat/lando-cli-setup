# Setup Lando

This repo is the single source of truth for all things relating to the installation and setup of (flos) Lando.

This currently includes:

* Windows/WSL2 setup scripts
* POSIX setup scripts
* Install docs

## Ok great, how do I get going now??

### macOS/linux

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/florianPat/lando-cli-setup/main/setup-lando.sh)"`

### Windows

`& ([ScriptBlock]::Create((Invoke-RestMethod https://raw.githubusercontent.com/florianPat/lando-cli-setup/main/setup-lando.ps1)))`

## Maintainers

- [florianPat](https://github.com/florianPat), as long as the pull request is not merged ;)

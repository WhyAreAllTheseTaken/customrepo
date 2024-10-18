# Custom Repo

customrepo is a debian package that provides a debian repository featuring packages that are either downloaded from other sources or built by the system.

## Warnings
1. This is primarily intended for my own personal use to manage my configurations and packages. As such, breaking changes may be made at any time.
2. The packages starting with `why-` are my own personal configurations of packages and metapackages. They may be changed at any time as I update my configuration. Installing them will break your existing configurations.

## Installation
To install download the git repository and run:
```bash
make && sudo make install
```
This will install a debian package that manages the custom repo and provides the neccesary commands.

## Usage
This package provides the command `custom_repo_build` that must be run as `root` that builds or downloads any custom packages. These can then be used normally using `apt`.
The general update process is:
1. `sudo custom_repo_build` - To update the repository. This will download or build any required packages.
2. `sudo apt update` - To update the packages available in `apt`.
3. `sudo apt upgrade` or `sudo apt install <package_name>`

### Upgrade Script
After installing the custom repository. You can install the `why-upgrade` package to quickly upgrade with one command.
```
sudo why_upgrade
```
This basically runs all of the above commands.

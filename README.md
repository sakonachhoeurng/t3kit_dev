# t3kit_dev

## Development environment for [t3kit](https://github.com/t3kit/t3kit) project.

[![Release](https://img.shields.io/github/release/visay/t3kit_dev.svg?style=flat-square)](https://github.com/visay/t3kit_dev/releases)

- [CHANGELOG](https://github.com/visay/t3kit_dev/blob/master/CHANGELOG.md)
- [CONTRIBUTING](https://github.com/t3kit/t3kit/blob/master/CONTRIBUTING.md)

#### Required dependencies:

* [Git](https://git-scm.com/)
* [PHP 5.6](http://php.net/downloads.php) with openssl and fileinfo extension enabled & [Composer](https://getcomposer.org/)

#### Additional requirements

- Existing GitHub user account with added [SSH key](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
- Existing Bitbucket user account with added [SSH key](https://confluence.atlassian.com/bitbucket/add-an-ssh-key-to-an-account-302811853.html)

***

## First Startup Options:

Choose one of following 2 methods which is git submodules or composer.

### 1. Git submodules

`git clone git@github.com:visay/t3kit_dev.git`

`cd t3kit_dev`

`./init.sh`

### 2. Composer:

`git clone git@github.com:visay/t3kit_dev.git`

`cd t3kit_dev`

`./initWithComposer.sh`

***

## Choosing your preferred development environment

- [Vagrant/VirtualBox](vagrant/README.md)
- [Docker](docker/README.md)

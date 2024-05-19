# MY ARCH DOT FILES

This repo has my dotfiles for my system

## Requirements 

Ensure having these installed on your system

### Git

```
# pacman -S git
```

### Stow

```
# pacman -S stow
```

## Installation
First clone the repo
```
$ git clone git@github.com:Scarborrower/.dotfiles.git
$ cd .dotfiles
```
Use GNU Stow to create symlinks for all/or any dotfile you want.

```
$ stow ./* #for all of the files
$ stow ./{dir} #for any particular config u need
```


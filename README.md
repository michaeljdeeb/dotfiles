# dotfiles

These files are managed using [GNU Stow](https://www.gnu.org/software/stow/) and are only being actively used on macOS.

If you have any questions, comments, or suggestions, feel free to [open an issue](https://github.com/michaeljdeeb/dotfiles/issues).

## Get Started

### Installing to a new computer
1. Add SSH key to `~/.ssh/` and `cd ~/.ssh/ && chmod 700 id_rsa`
2. `git clone -b gnu-stow-mac git@github.com:michaeljdeeb/dotfiles.git --recursive`
  1. **NOTE:** Be sure to change to the `gnu-stow-linux` branch
  2. **NOTE:** Make sure to use `--recursive` for the repository's submodules. 
4. Install [stow](https://www.gnu.org/software/stow/)
5. `stow ${folder-in-dotfiles}` for every application you would like dotfiles for.

## Using Submodules

### Add a submodule
For example, installing [vim-airline](https://github.com/vim-airline/vim-airline):
```bash
cd ~/dotfiles/vim/.vim/bundle
git submodule add https://github.com/vim-airline/vim-airline
```

### Updating all submodules
```bash
git submodule update --init --recursive
```

#### Updating YouCompleteMe
```bash
cd ~dotfiles/vim/.vim/bundle/YouCompleteMe/
./install.py --tern-completer
```

### Remove a submodule
For example, removing [vim-airline](https://github.com/vim-airline/vim-airline):
```bash
cd ~/dotfiles/
git rm vim/.vim/bundle/vim-airline
```
**NOTE:** Make sure the submodule is removed from `.gitmodules`, `.git/config`, and `.git/modules/` as well as actually being removed from the file system.

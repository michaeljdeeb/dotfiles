# dotfiles

### How to start tracking dotfiles
```bash
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

### Installing to a new computer
1. `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME`
2. `echo ".dotfiles" >> .gitignore`
3. `git clone --bare --recursive https://github.com/michaeljdeeb/dotfiles.git $HOME/.dotfiles`
4. `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME`
5. `dotfiles checkout`

Source: [The best way to store your dotfiles: A bare Git repository](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

To safely delete `~/README.md` locally, run `dotfiles update-index --assume-unchanged README.md`
If you need to update `README.md`, run `dotfiles update-index --no-assume-unchanged README.md`

## Using Submodules

### Add a submodule
For example, installing [vim-airline](https://github.com/vim-airline/vim-airline):
```bash
cd ~/.vim/bundle
dotfiles submodule add https://github.com/vim-airline/vim-airline
```

### Update a submodule
For example, upating [vim-airline](https://github.com/vim-airline/vim-airline):
```bash
cd ~/.vim/bundle/vim-airline
dotfiles pull
```

### Updating all submodules
```bash
dofiles submodule update --recursive --remote
```

### Remove a submodule
For example, removing [vim-airline](https://github.com/vim-airline/vim-airline):
```bash
cd ~/.vim/bundle
dotfiles submodule deinit -f vim-airline
dotfiles rm -rf vim-airline
```

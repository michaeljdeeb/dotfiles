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
3. `git clone --bare https://github.com/michaeljdeeb/dotfiles.git $HOME/.dotfiles`
4. `alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME`
5. `config checkout`

Source: [The best way to store your dotfiles: A bare Git repository](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

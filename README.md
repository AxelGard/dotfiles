# dotfiles
My dot files and configs

I use [GNU stow](https://www.gnu.org/software/stow/) to link my dotfiles.

Install stow on ubuntu
```bash
sudo apt install stow
```

place the repo in the home dir 
```bash
git clone git@github.com:AxelGard/dotfiles.git ~/.dotfiles
```

go to the repo
```bash
cd ~/.dotfiles
```

run stow 
```bash
stow --adopt .
```

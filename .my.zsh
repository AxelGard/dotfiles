
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CFa'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if command -v nvim >/dev/null 2>&1; then
  alias vi=nvim
else
  alias vi=vim
fi

alias py=python3
alias python="python3 $@"
alias tdo="vi ~/.todo.md"
alias todo="vi ~/.todo.md"
alias mkvite="npm create vite@latest"

# fix-x 
alias fixbash="vi ~/.bashrc"
alias srcbash="source ~/.bashrc"
alias fixdot="cd ~/.dotfiles"
alias fixnvim="vi ~/.dotfiles/.config/nvim"
alias fixvim="vi ~/.dotfiles/.vimrc"
alias fixtmux="vi ~/.dotfiles/.config/tmux/tmux.conf"
alias fixzed="vi ~/.dotfiles/.config/zed/settings.json"
alias fixcode="vi ~/.config/Code/User/settings.json"
alias fixvscode="vi ~/.config/Code/User/settings.json"
alias fixcodekeys="vi ~/.config/Code/User/keybindings.json"

alias awakessh="eval `ssh-agent -s`"


alias :q="exit"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"

# Rust 
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# deno 
export DENO_INSTALL="/home/axel/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Zed editor
if [ -f ~/.local/bin/zed ]; then
    export PATH=$HOME/.local/bin:$PATH
    alias zed="~/.local/bin/zed $@"
fi

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
alias zed="open -a /Applications/Zed.app -n"

eval "$(ssh-agent -s)" >/dev/null
ssh-add --apple-use-keychain ~/.ssh/GitHub >/dev/null 2>&1 &

source $(brew --prefix nvm)/nvm.sh


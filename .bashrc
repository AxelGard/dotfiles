# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi



# Git branch in prompt.
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/(\1)/' | tr -d ' '
}
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[35m\]\$(git_branch)\[\033[00m\]\$ "
#if [ "$color_prompt" = yes ]; then
#else
#    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
#fi
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "



unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF --color'
alias la='ls -A --color'
alias l='ls -CFa --color'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Function to search history with fzf
fzf_history_search() {
    local selected_command
    selected_command=$(history | awk '{$1=""; print $0}' | sort | uniq | fzf --tiebreak=index | sed 's/^ *//')
    if [[ -n $selected_command ]]; then
        READLINE_LINE="$selected_command"
        READLINE_POINT=${#READLINE_LINE}
    fi
}
# Bind the function to Ctrl-r
bind -x '"\C-r": fzf_history_search'



#if [[ "$(uname)" == "Darwin" ]]; then
    # Mac-specific commands go here
    
#fi
#else
    # Linux-specific or general commands go here    

#fi

 [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"



export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


if command -v nvim >/dev/null 2>&1; then
  alias vi=nvim
else
  alias vi=vim
fi

alias py=python3
alias tdo="vi ~/.todo.md"
alias todo="vi ~/.todo.md"
alias mkvite="npm create vite@latest"

# fix-x 
alias fixbash="vi ~/.bashrc"
alias fixlocalbash="vi ~/.local_bashrc.bash"
alias srcbash="source ~/.bashrc"
alias fixtmux="vi ~/.dotfiles/.tmux.conf"
alias fixdot="cd ~/.dotfiles"
alias fixnvim="vi ~/.dotfiles/.config/nvim"
alias fixvim="vi ~/.dotfiles/.vimrc"
#alias fixtmux="vi ~/.dotfiles/.config/tmux/tmux.conf"
alias srctmux="tmux source-file ~/.tmux.conf"
alias fixzed="vi ~/.dotfiles/.config/zed/settings.json"
alias fixcode="vi ~/.config/Code/User/settings.json"
alias fixvscode="vi ~/.config/Code/User/settings.json"
alias fixcodekeys="vi ~/.config/Code/User/keybindings.json"

alias awakessh="eval `ssh-agent -s`"

alias mktar="tar -czvf $1.tar.gz $1"
alias untar="tar -xvf $@"

alias search="grep -r -i --color $@"

alias :q="exit"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias cddot="cd ~/.dotfiles/"

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


if [ -f ~/.ssh/GitHub.pub ]; then 
 	eval "$(ssh-agent -s)" >/dev/null
	ssh-add --apple-use-keychain ~/.ssh/GitHub >/dev/null 2>&1
fi

export PATH="/Users/axel/Programs/odin:$PATH"

export PATH="/opt/homebrew/bin:$PATH"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
alias zed="open -a /Applications/Zed.app -n"

if [ -f ~/.local_bashrc.bash ]; then
    source ~/.local_bashrc.bash
fi


export EDITOR='nvim'
export VISUAL='nvim'

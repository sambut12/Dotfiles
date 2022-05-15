# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/philip/.oh-my-zsh"
export TERM=xterm-256color
# Loads the ZSH theme.
ZSH_THEME="af-magic"

# Package manager aliases.
alias pacup='sudo pacman -Syu '
alias pacs='pacman -Ss'
alias pacins='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacq='pacman -Q'
alias pacu='sudo pacman -U'

#Dotfiles automation
alias dotfiles='/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=${HOME}'

#Git aliases
alias gita='git add'
alias gitcm='git commit -m'
alias gitl='git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias gits='git status'

bindkey '^[[C-w' backward-kill-word

# Plugins for syntax colouring and autocomplete.
plugins=(git)
plugins=(
    fzf
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)

# Launches oh-my-zsh.
source $ZSH/oh-my-zsh.sh
   # If not running interactively, don't do anything 
   [[ $- != *i* ]] && return 

# User configuration
export MANPATH="/usr/local/man:$MANPATH"



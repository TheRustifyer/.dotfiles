# HOME as $HOME, pls ;)
export HOME="$HOME"

# Starship!
eval "$(starship init zsh)"
function set_win_title() {
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"

function blastoff() {
    echo "🚀"
}
starship_precmd_user_func="blastoff"

HIST_STAMPS="dd.mm.yyyy"

# User configuration
export TERM=xterm-256color

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Preferred editor
export EDITOR='nvim'

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# fpath=(./zsh-completions/src $fpath)

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Set personal aliases TODO: move them to their own mod
alias me='cd $HOME'
alias zshconf="nvim ~/.zshrc"
alias vi=nvim
alias lg='lazygit'

alias .='cd .'
alias ..='cd ..'
alias bashcls='echo "" > ~/.bash_history'
alias cls='clear'
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
alias ll.='ls -la'
alias lls='ls -la --sort=size'
alias llt='ls -la --sort=time'
alias rmdir='rm -rf'

alias wincode='cd ~/code'
alias appdata='cd ~/AppData'


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias nvimconf='cd ~/.config/nvim && nvim'
    alias nvimdir='cd ~/.config/nvim'
    alias rmnvim="find ~/.cache ~/.local -type d -name '*nvim*' -exec rm -rf {} +"
else
    alias nvimconf='cd ~/AppData/Local/nvim && nvim'
    alias nvimdir='cd ~/AppData/Local/nvim'
    alias rmnvim='rm -rf ~/AppData/Local/nvim && rm -rf ~/AppData/Local/nvim-data'
fi

# Git aliases
alias gs='git status -sb'
alias gco='git checkout'
alias gcm='git checkout main'
alias gaa='git add --all'
alias gco='git commit -m $2'
alias gp='git push'
alias gpo='git push origin'
alias gpll='git pull'
alias gcl='git clone'
alias gst='git stash'
alias gpop='git stash pop'
alias ga='git add'
alias gb='git branch'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gm='git merge'
alias gmnff='git merge --no-ff'

# For work with my bare git repo for the dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME/'


# Using `bat` as a better `cat`
alias cat='bat'

# Adding Clang and LLVM Project to the PATH
# TODO: deprecated. Change the path
# with the git submodule that comes with the dotfiles
export PATH="$HOME/tools/llvm-project/build/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/tools/llvm-project/build/lib:$LD_LIBRARY_PATH"

# Having GitHub CLI avaliable on path on Windows
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    export PATH="$HOME/gh-cli/bin:$PATH"
fi

# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


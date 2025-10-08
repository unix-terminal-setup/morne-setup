
# GIT FUNCTIONS
git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# TERMINAL PROMPT
PS1="\[\e[0;93m\]\u\[\e[m\]"    # username
PS1+=" "    # space
PS1+="\[\e[0;95m\]\W\[\e[m\]"    # current directory
PS1+="\[\e[0;92m\]\$(git_branch)\[\e[m\]"    # current branch
PS1+=" "    # space
PS1+=">> "    # end prompt

export PS1;
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export BASH_SILENCE_DEPRECATION_WARNING=1
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)

alias ls='lsd -Alh'
alias gits='git status'
alias weather='curl wttr.in/Randburg'
alias vim='nvim'
alias lg='lazygit'
alias y='yazi'
alias zellij='~/.zellij/zellij'
alias gd-format='gdformat $(find . -name "*.gd" -not -path "./addons/*")'
alias web-check='~/tools/internet-check.sh'
eval "$(/opt/homebrew/bin/brew shellenv)"

export ASPNETCORE_ENVIRONMENT=Development
export PATH="/Users/morne/Library/Python/3.9/bin:$PATH"


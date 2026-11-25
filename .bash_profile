
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

alias ls='lsd -Alh'
alias gits='git status'
alias lg='lazygit'
alias y='yazi'
alias gd-format='gdformat $(find . -name "*.gd" -not -path "./addons/*")'
alias z='zellij attach -c DEV'

export ASPNETCORE_ENVIRONMENT=Development
export PATH="$HOME/.local/bin:$PATH"

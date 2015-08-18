# Sources
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Bash completion scripts - fetched from Homebrew
if [ $(type -t brew) ]
then
    FILES=`brew --prefix`/etc/bash_completion.d/*
    for f in $FILES
    do
        source $f
    done
fi

# Get the crayons out
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'

# Include the Git prompt if installed
if [ $(type -t __git_ps1) ]
then
    export PS1="\[\e[1;32m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\]\[\e[0;36m\]\$(__git_ps1)\[\e[0m\]$ ";
else
    export PS1="\[\e[1;32m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\]$ ";
fi

# Navigation aliases
alias l='ls -Alh'
alias up='cd ..'
alias upd='cdd ..'

# Web browser aliases
alias chrome='open -a /Applications/Google\ Chrome.app'
alias firefox='open -a /Applications/Firefox.app'
alias safari='open -a /Applications/Safari.app/'

# Web shortcuts
alias github='chrome https://github.com/orgs/SnapFashion/dashboard'

# Profile aliases to make editing and reloading easy
alias edit_profile='atom ~/.profile'
alias reload_profile='source ~/.profile'

# git aliases
alias git_clean_remote='git remote prune origin;git branch -a;echo "PRUNE YO BRANCHES!"'
alias git_clean_local='git branch --merged | grep -v -e "master" -e "develop" | xargs git branch -d;echo "SO FRESH AND SO CLEAN CLEAN!"'

# Function to change directory and display contents
function cdd() {
    if [ "$*" = "" ]
    then
        cd
    else
        cd "$*";
    fi
    ls -Alh;
}

# Function to search all files in the current directory and all subdirectories for a specific string.
# The search is case insensitive and shows the line numbers of all search results in their files.
function wheres_wordy()
{
    if [ "$*" != "" ]
    then
        grep -RnisI "$*" *;
    fi
}

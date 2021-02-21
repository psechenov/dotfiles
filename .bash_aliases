alias mc="mc --nosubshell"
alias ll="ls -la"
alias grep='grep --color=auto'  
alias ls='ls --color=always'
alias gg='git grep -ni'
alias biggest="du -h --max-depth=1 | sort -h"
alias psy="cd ~/code/github.com/psych3"
alias follow="tail -f -n +1"

function grepcode { grep -rnIi "$1" "/home/ps/code" --color; }
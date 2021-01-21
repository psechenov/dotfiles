
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=10000000
export HISTFILESIZE=1000000000
shopt -s histappend

export TERM=xterm-color
export EDITOR=/usr/bin/vim

# I'd quite like for Go to work please.
export PATH=${PATH}:/usr/local/go/bin
export GOPATH=~

export GREP_COLOR='1;32'
#export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'



alias mc="mc --nosubshell"
alias ll="ls -la"
alias grep='grep --color=auto'  
alias ls='ls --color=always'
alias gg='git grep -ni'
alias biggest="du -h --max-depth=1 | sort -h"
alias psy="cd ~/code/github.com/psych3"
alias follow="tail -f -n +1"

# 'Safe' version of __git_ps1 to avoid errors on systems that don't have it
function gitPrompt {
  command -v __git_ps1 > /dev/null && __git_ps1 " (%s)"
}

# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
atC="${txtpur}"
nameC="${txtpur}"
hostC="${txtpur}"
pathC="${txtgrn}"
gitC="${txtpur}"
pointerC="${txtgrn}"
normalC="${txtwht}"

# Red name for root
if [ "${UID}" -eq "0" ]; then 
  nameC="${txtred}" 
fi

# Patent Pending Prompt
export PS1="${nameC}\u${atC}@${hostC}\h:${pathC}\w${gitC}\$(gitPrompt)${pointerC}▶${normalC} "

# Show git branch name
#force_color_prompt=yes
#color_prompt=yes
#parse_git_branch() {
# git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}
#if [ "$color_prompt" = yes ]; then
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
#else
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
#fi
#unset color_prompt force_color_prompt

# Local settings go last
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

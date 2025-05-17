
# ~/.bashrc: executed by bash(1) for non-login shells.
#
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

#uncomment for a colored prompt, if the terminal has the capability; turned
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

if [ "$color_prompt" = yes ]; then
# modified from 
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\$[\033[01;34m\]\w\[\033[00m\]\ '
# in order to make shorter and less redundent (removed @\h\)
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# this PS1 does not work
    #PS1='\[\033[01;32m\]clayton\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $ '
# no color
    #PS1='$:\w '
    PS1='\[\e[1;35m\]:D\[\e[00m\]\[\e[1;34m\]\w\[\e[00m\]\[\e[1;35m\]$\[\e[00m\] '  
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# vi mode
set -o vi 

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# let fzf see hidden files 

export FZF_DEFAULT_COMMAND='bfs'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


source ~/code/shellCuts

#### aliases #### 

#alias red='redshift -O 5000'
#alias off='redshift -x'
#alias mat='/usr/local/matlab/bin/matlab;bg;exit'
## alias to make fzf open vim
#alias f='vim "$(fzf)"'
## fastfetch
#alias aw='firefox --new-tab http://localhost:5600/#/activity/clayton-Latitude-7400/view/;exit'
## for filler windows 
#alias colors='/home/clayton/code/print_colors.sh'
## navagate directories with fzf
##alias fd='cd "$(dirname "$(find . -type d | fzf)")"'
#alias fd='cd "$(dirname "$(fzf)")"'
#alias fdf='find . -type d | fzf'

## toggle posture notification cronjob
#alias postureOn='rm -i ~/code/postureCheck'
#alias postureOff='touch ~/code/postureCheck'

##### variables #### 

##shortcut for piping to system clipboard 
#clip="xclip -selection clipboard"


##easily access directory where I store scripts 
#scr=""~/code""

## open matlab
#m='/usr/local/MATLAB/bin/matlab'

## echo -e '\ Hi!!!!\n' | lolcat
##/$HOME/OneDrive/Programming/startup.sh


##### functions ####

## be able to easily access i3 config 
#i3c (){
#cd ~/.config/i3 ; vim config
#}
## find without timeshift 
## F (){
##	find / 2>/dev/null -path ./timeshift -prune -o -name "*$1*" 
##}

#F (){

#find / 2>/dev/null ! -path "*timeshift/*"
#}
##start matlab no desktop 
#mnd (){
#	$m -nodesktop -nosplash
#}



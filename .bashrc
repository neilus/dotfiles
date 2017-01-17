# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hFG '                 # classify files in colour
alias dir='ls -G --color=auto --format=vertical'
alias vdir='ls -G -color=auto --format=long'
alias ll='ls -lG'                              # long list
alias la='ls -AG'                              # all but . and ..
alias l='ls -CFG'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi
#
# Some example functions:
#
# a) function settitle
# settitle ()
# {
#   echo -ne "\e]2;$@\a\e]1;$@\a";
# }
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func
if [ -f "/etc/bashrc" ]; then
  source "/etc/bashrc"
fi
if [ -f "$HOME/.bash_completion.d/git-completion.sh" ]; then
  source ~/.bash_completion.d/git-completion.sh
fi
if [ -f "$HOME/.bash_completion.d/git-prompt.sh" ]; then
  source ~/.bash_completion.d/git-prompt.sh
fi
if [ -f "$HOME/.bash_completion.d/waslp/server" ]; then
  source ~/.bash_completion.d/waslp/server
fi

PS1='[\[\033[01;32m\] \u\[\033[00m\]@\[\033[01;33m\]\h \[\033[01;34m\]\W\[\033[01;39m\]$(__git_ps1 " (%s)")\[\033[00m\] ]\$ '

alias kefir='nohup Xephyr -screen 960x1020 :1 &'
alias gshell='gnome-shell --sm-disable --replace -d :1'
alias devshell='kefir gshell'
alias vim='vim -v '
function whichemacs(){
  /usr/bin/emacsclient -n $@ >>/dev/null 2>/dev/null || /usr/bin/emacs $@;
}
alias emacs=whichemacs
alias emacsclient='emacsclient -n'
export EXTENSIONS='.local/share/gnome-shell/extensions'
export LD_LIBRARY_PATH="/usr/lib":"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/c++"
export PATH=~/bin:~/bin/npm/bin:$PATH
## android sdk tools
export PATH=/opt/google/adk/tools:/opt/google/adk/platform-tools:/opt/google/adk/build-tools:$PATH
export PATH=/usr/local/bin:/usr/bin:$PATH
export PATH=~/.local/cloud9/bin:$PATH
export PATH="/usr/local/texlive/2014/bin/x86_64-darwin":"$PATH" # LaTeX on Mac
export PATH="$PATH":"/usr/local/Cellar/graphviz/2.38.0/bin" # graphviz from homebrew on Mac
export PATH="$PATH":~/Development/adt-bundle-mac-x86_64-20140702/sdk/tools:~/Development/adt-bundle-mac-x86_64-20140702/sdk/build-tools:~/Development/adt-bundle-mac-x86_64-20140702/sdk/platform-tools

#export JAVA_HOME=/usr/java/jdk1.7.0_25
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home

export WORKON_HOME=~/Envs
#source /usr/local/bin/virtualenvwrapper.sh
export HOMEBREW_GITHUB_API_TOKEN=1d7041107d815130fafb18036ea50dde48c196ec


if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
      source `brew --prefix`/etc/bash_completion.d/vagrant
fi

# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export PATH=/usr/local/sbin:$PATH
. /Users/neilus/.profabevjava

# Bash completion support
source /usr/local/etc/bash_completion

# Kubectl shell completion
source '/Users/neilus/.kube/completion.bash.inc'
source '/Users/neilus/.kube/minikube_completion.bash.inc'
export PATH="/usr/local/opt/qt/bin:$PATH"

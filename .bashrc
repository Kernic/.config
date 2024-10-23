#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias la='ls -a --color=auto'
alias python="python3.8"
alias pip="pip3.8"
export LD_LIBRARY_PATH="/opt/cuda/lib64:$LD_LIBRARY_PATH"
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
alias conda_env='ls ~/.conda/envs/'
source /usr/local/lib/bazel/bin/bazel-complete.bash

PS1='\[\e[32m\][\u@\h]\[\e[0m\]\[\e[34m\] \d | \t\[\e[0m\]\n\[\e[1;33m\]\w \$\[\e[0m\] '
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


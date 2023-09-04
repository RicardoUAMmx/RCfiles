# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export RCFILES="$HOME/.rcfiles"
export HISTFILE="$RCFILES/.bash_history"
export LESSHISTFILE="$RCFILES/.lesshst"

export WSL_HOME="/mnt/c/Users/ricar"
export WSL_PROGRAMS="$WSL_HOME/AppData/Local/Programs"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -d "$RCFILES" ]; then
	# Include bashrc
	if [ -f "$RCFILES/.bashrc" ]; then
	    . "$RCFILES/.bashrc"
	else
	    . "$HOME/.bashrc"
	fi
	# Include bash_functions
	if [ -f "$RCFILES/.bash_functions" ]; then
	    . "$RCFILES/.bash_functions"
	fi
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set HOMEBREW env variables
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Oh-my-posh pointer to share a good look with PWSH
eval "$(oh-my-posh init bash --config "${WSL_PROGRAMS}/oh-my-posh/themes/montys.omp.json")"

#!/bin/sh

export PATH=~/bin:$PATH
export HISTFILESIZE=10000
export HISTSIZE=10000

# source functions
. ~/bin/.functions

# start sshd
termux_start_sshd

# auto complete
. $PREFIX/etc/bash_completion.d/git*

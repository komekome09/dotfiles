### color ###
autoload -U colors
colors
autoload -Uz compinit
compinit
autoload -Uz zmv

### prompt ###
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# "
export LSCOLORS=gxfxcxdxbxegedabagacad

### export ###
export PATH=/usr/local/bin:$PATH
export PATH=/usr/texbin:$PATH
export PATH=/opt:$PATH
export PATH=/usr/local/CrossPack-AVR/bin:$PATH
export PATH=/opt/local/bin:$PATH
export TERM=xterm-256color
export PATH="$PATH:/Applications/android-sdk/sdk/platform-tools"
export PATH="$PATH:$HOME/.gem/ruby/2.0.0/bin"

### alias ###
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
alias rezsh='source ~/.zshrc'
alias pswitch=~/.ch_proxy.sh

### cd function ###
function cd() {
	builtin cd $@ && ls;
}

### tmux ###
# tmux is already started?
if [[ -z "$TMUX" && ! -z "$PS1" ]]; then
		tmux attach;

		# if not detach
		if [ $? ]; then
				tmux;
		fi
fi

### proxy switch ###
source ~/.ch_proxy.sh

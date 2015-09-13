### color ###
autoload -U colors
colors
autoload -Uz compinit
compinit
autoload -Uz zmv

### prompt ###
PROMPT="%(?!%F{green}(*'v'*)%f!%F{cyan}(*'o'*%)%f) %{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# "
export LSCOLORS=gxfxcxdxbxegedabagacad

### export ###
export TERM=xterm-256color
export PATH=/usr/local/bin:$PATH
export PATH=/usr/texbin:$PATH
export PATH=/opt:$PATH
export PATH=/usr/local/CrossPack-AVR/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin
export PATH=$PATH:$HOME/opt/review/bin
export PATH=$PATH:$HOME/opt/scala-2.11.6/bin
export PATH=$PATH:$HOME/Applications/Electron.app/Contents/MacOS/
export PATH=$PATH:$HOME/opt/direnv-2.6.0

### boost
export BOOST_ROOT=/usr/local/Cellar/boost/1.58.0

### alias ###
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
alias rezsh='source ~/.zshrc'

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

type direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"

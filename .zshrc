### prompt colors ###
autoload -U colors
colors

### zsh completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit -u

### zsh mv
autoload -Uz zmv

### export ###
export TERM=xterm-256color
export PATH=/usr/local/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
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

### other
export EDITOR='/usr/local/bin/vim'

### history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

### alias ###
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
alias rezsh='source ~/.zshrc'
alias zshrc='vim $HOME/.zshrc'
alias chkdev='ls /dev/ | grep usbserial'

### bind key ###
bindkey -e

### cd function ###
function cd() {
	builtin cd $@ && ls;
}

### gitignore.io ###
function gi() {
    curl -L -s https://www.gitignore.io/api/$@;
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
### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

### show branch info
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
setopt PROMPT_SUBST    # プロンプト表示ごとに変数を展開する

zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats '%F{green}[%b]%f'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
_vcs_precmd () { vcs_info }  # vcs_info関数を呼び出す。vcs情報はformatsで整形され vcs_info_msg_0_ に挿入される
add-zsh-hook precmd _vcs_precmd # 上の関数をプロンプト表示前に実行させる

### prompt ###
PROMPT='%(?!%F{green}(*'v'*)%f!%F{cyan}(*'o'*%)%f) %{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg_no_bold[yellow]%}%~ ${vcs_info_msg_0_} %{$reset_color%}%# '
export LSCOLORS=gxfxcxdxbxegedabagacad

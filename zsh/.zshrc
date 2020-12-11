### prompt colors ###
autoload -U colors
colors

### zsh completion
autoload -Uz compinit
compinit -u

### zsh mv
autoload -Uz zmv

### other
export EDITOR=$(which vim)

### history
export HISTFILE=${HOME}/.zsh_history
if [[ -f ${HOME}/.zsh_history ]] ; then
    touch ${HOME}/.zsh_history
fi
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

### bind key ###
bindkey -e
bindkey "[3~" delete-char

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

type direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
export PATH=$PATH:$HOME/.nodebrew/current/bin

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
PROMPT='%(?!%F{green}(*'\''v'\''*)%f!%F{cyan}(*'\'''o\''*%)%f) %{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg_no_bold[yellow]%}%~ ${vcs_info_msg_0_} %{$reset_color%}%# '
export LSCOLORS=gxfxcxdxbxegedabagacad
       
#OS dependent
case $(uname) in
    darwin*)
        echo "darwin"
        [ -f $HOME/.zshrc.darwin ] && . $HOME/.zshrc.darwin
        ;;
    linux*)
        echo "linux"
        [ -f $HOME/.zshrc.linux ] && . $HOME/.zshrc.linux
        ;;
esac

source $HOME/.cargo/env

if [[ -d $HOME/.nvm ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] &&  \. "$NVM_DIR/nvm.sh" --no-use # This load nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This load nvm bash_completion
fi


# OS dependent
case $(uname) in
    darwin*)
        echo "darwin"
        ;;
    linux*)
        echo "linux"
        ;;
esac


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
export PATH=/usr/local/opt/llvm/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=/opt:$PATH
export PATH=/usr/local/CrossPack-AVR/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin
export PATH=$PATH:$HOME/opt/review/bin
export PATH=$PATH:$HOME/opt/bin
export PATH=$PATH:$HOME/opt/scala-2.11.6/bin
export PATH=$PATH:$HOME/Applications/Electron.app/Contents/MacOS/
export PATH=$PATH:$HOME/opt/direnv-2.6.0
export PATH="$PATH:/Applications/Wine Staging.app/Contents/Resources/wine/bin"
export PATH="$PATH:$HOME/Library/Python/3.7/bin"
export PATH="$PATH:$HOME/google-cloud-sdk/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"

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
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

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

### proxy switch ###
source ~/.ch_proxy.sh

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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/komekome09/go-lambda/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/komekome09/go-lambda/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/komekome09/go-lambda/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/komekome09/go-lambda/node_modules/tabtab/.completions/sls.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/komekome09/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/komekome09/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/komekome09/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/komekome09/google-cloud-sdk/completion.zsh.inc'; fi

            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
        

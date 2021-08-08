"#### show setting ####
set title " show editing file
syntax on " color syntax of editor
colorscheme elflord
set tabstop=4 " indent = space x 4
set softtabstop=4 " To use this param, delete space which number only indent in BS
set shiftwidth=4
set smartindent " auto indent
set autowrite
set expandtab

"#### search setting ####
set ignorecase " case-insensitive(not tell large character from small character) in serach
set wrapscan " if search is end of line, continue the search on the top

"#### basic setting ####
set nocompatible " not vi compatible
set autoindent " if return, next line's indent is same as above line
if !isdirectory(expand('$HOME/.vimbak'))
    call mkdir(expand("$HOME/.vimbak" ))
endif
set backupdir=$HOME/.vimbak " directory of backup file
set directory=$HOME/.vimbak " directory of .swp file
set number " line number
set noswapfile " not make a swap file
set viminfo= " not make a .viminfo file
set display=lastline " if display size is changed, display character as possible

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

"#### key map ####
set backspace=start,eol,indent
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
inoremap <A-h> <Nop>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-h> <Left>
inoremap <A-l> <Right>
"## QuickFix ##
nnoremap [q :cprevious<CR> " 前へ
nnoremap ]q :cnext<CR> " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR> " 最後へ

"#### character code ####
set encoding=utf-8 

"#### another setting file ####
if filereadable(expand('~/.vimrc.dein')) && &runtimepath =~# 'dein.vim' "is file readable and dein.vim installed?
	source ~/.vimrc.dein
endif

"#### autogroup ####
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

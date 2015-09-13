"#### show setting ####
set title " show editing file
syntax on " color syntax of editor
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
set backupdir=$HOME/.vimbak " directory of backup file
set directory=$HOME/.vimbak " directory of .swp file
set number " line number
set noswapfile " not make a swap file
set viminfo= " not make a .viminfo file
set display=lastline " if display size is changed, display character as possible

"#### key map ####
set backspace=start,eol,indent
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
inoremap <C-h> <Nop>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>


"#### character code ####
set encoding=utf-8 

"#### another setting file ####
if filereadable(expand('~/.vimrc.neobundle')) "is file readable?
	source ~/.vimrc.neobundle
endif

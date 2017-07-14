set number
set encoding=utf-8
set cursorline
if has('win32')
    let ostype = "Win"
elseif has('mac')
    let ostype = "Mac"
	set clipboard+=unnamed
else
    let ostype = system("uname")
	set clipboard&
	set clipboard^=unnamedplus
endif
set incsearch
set wildmenu wildmode=list:full
set title
set showmatch
syntax on
set autoindent
set shiftwidth=4
set softtabstop=4
set cindent
set ignorecase
set smartcase
set wrapscan
set list listchars=tab:\¦\ 
inoremap { {}<left>
nnoremap j gj
nnoremap k gk
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <D-b> <esc>
inoremap <C-e> <Delete>
inoremap <S-j> J
nnoremap <S-j> J
nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap sj <C-w>+
nnoremap sk <C-w>-
nnoremap sl <C-w>>
nnoremap sh <C-w><
nnoremap ; :
nnoremap fd <S-v>%zf
nnoremap go :<C-u>call append(expand('.'), '')<Cr>j
set tabstop=4
set fileencodings=sjis,euc-jp,utf-8
set mouse=a
set ttymouse=xterm2


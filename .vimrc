set number
set encoding=utf-8
set cursorline
set clipboard&
set clipboard^=unnamedplus
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
set columns=110
set lines=35
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

"vimの操作中に色を消せるコマンドが欲しい。たまに見にくい色があるから一瞬全部白にしたい。

"考え中のこと
"neocompleteで予測できるのはいいが、名前のみの表示なのが残念。関数の説明(ドキュメンテーションコメント)や引数がわかると嬉しい。

"------------------------------------------------------------------
"Neo Bundle Setting
"------------------------------------------------------------------
if has('vim_starting')
    set nocompatible               " Be iMproved

" Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'nathanaelkane/vim-indent-guides'                 " インデントハイライトプラグイン
NeoBundle 'kana/vim-submode'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-scripts/MultipleSearch'
NeoBundle 'rbtnn/vimconsole.vim.git'
NeoBundle "Shougo/neocomplete.vim"
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }

NeoBundle 'Yggdroot/indentLine'
let g:indentLine_faster = 1
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|'

NeoBundle 'bronson/vim-trailing-whitespace'
if neobundle#tap('vim-trailing-whitespace')
	" uniteでスペースが表示されるので、設定でOFFにします。
	let g:extra_whitespace_ignored_filetypes = ['unite']
endif

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"------------------------------------------------------------------
"Neo Bundle Setting End
"------------------------------------------------------------------
"
"------------------------------------------------------------------
"vim-submode Setting
"------------------------------------------------------------------
call submode#enter_with('winsize', 'n', '', 'sh', '<C-w><')
call submode#enter_with('winsize', 'n', '', 'sl', '<C-w>>')
call submode#enter_with('winsize', 'n', '', 'sj', '<C-w>-')
call submode#enter_with('winsize', 'n', '', 'sk', '<C-w>+')
call submode#map('winsize', 'n', '', 'h', '<C-w><')
call submode#map('winsize', 'n', '', 'l', '<C-w>>')
call submode#map('winsize', 'n', '', 'j', '<C-w>-')
call submode#map('winsize', 'n', '', 'k', '<C-w>+')

call submode#enter_with('changetabFor', 'n', '', 'gt', 'gt')
call submode#enter_with('changetabBack', 'n', '', 'gT', 'gT')
call submode#map('changetabFor', 'n', '', 't', 'gt')
call submode#map('changetabBack', 'n', '', 'T', 'gT')
call submode#map('changetabBack', 'n', '', 't', 'gT')

"------------------------------------------------------------------
"vim-submode Setting End
"------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#skip_auto_completion_time = ""

"------------------------------------------------------------------
"Neoyank Setting
"------------------------------------------------------------------
let g:neoyank#limit
let g:neoyank#file

"------------------------------------------------------------------
"Unite Setting
"------------------------------------------------------------------
"インサートモードで開始
let g:unite_enable_start_insert=1
"prefix keyの設定
nmap f [unite]

"Current Directory
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"最近開いたファイルとバッファ
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
"最近開いたディレクトリ
nnoremap <silent> [unite]m :<C-u>Unite<Space>directory_mru<CR>
"Buffer
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
"Register
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
"Tab
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
"History and yank
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
"スペースキーとoキーでoutline
"outline
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
"file_rec:!
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>
"Quit
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction"}}}

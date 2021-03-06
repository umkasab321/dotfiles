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
	set columns=150
	set lines=45
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

"vimの操作中に色を消せるコマンドが欲しい。たまに見にくい色があるから一瞬全部白にしたい。

"考え中のこと
"neocompleteで予測できるのはいいが、名前のみの表示なのが残念。関数の説明(ドキュメンテーションコメント)や引数がわかると嬉しい。

"------------------------------------------------------------------
" Dein.vim Setting
"------------------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  "Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('kana/vim-submode')
  call dein#add('kana/vim-smartchr')
  call dein#add('kana/vim-smartinput')
  call dein#add('umkasab321/RCedit')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('Yggdroot/indentLine')
  call dein#add('vim-scripts/MultipleSearch')
  call dein#add('rbtnn/vimconsole.vim.git')
  call dein#add('Shougo/neocomplete.vim')
  " call dein#add('Shougo/vimproc'), {
	"   \ 'build' : {
	" 	  \ 'windows' : 'make -f make_mingw32.mak',
	" 		  \ 'cygwin' : 'make -f make_cygwin.mak',
	" 		  \ 'mac' : 'make -f make_mac.mak',
	" 		  \ 'unix' : 'make -f make_unix.mak',
	" 		  \ },
	" 	  \ }

" You can specify revision/branch/tag.
"	call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"------------------------------------------------------------------
"vim-trailing-whitespac eSetting
"------------------------------------------------------------------
if dein#tap('vim-trailing-whitespace')
	" uniteでスペースが表示されるので、設定でOFFにします。
	let g:extra_whitespace_ignored_filetypes = ['unite']
endif

"------------------------------------------------------------------
"indentLine Setting
"------------------------------------------------------------------
let g:indentLine_faster = 1
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|'

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
let g:neoyank#limit  = 100
let g:neoyank#file = $HOME.'/.cache/neoyank/history_yank'

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
"outline
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
"file_rec:!
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>
"Quit
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction"}}}

"--------------------------------------------------------------
"Smartchr,SmartImput Config
"--------------------------------------------------------------
" let lst = [   ['<',     "smartchr#loop(' < ', ' << ', '<')" ],
" 		\ ['>',     "smartchr#loop(' > ', ' >> ', ' >>> ', '>')"],
" 			\ ['+',     "smartchr#loop(' + ', ' ++ ', '+')"],
" 			\ ['-',     "smartchr#loop(' - ', ' -- ', '-')"],
" 			\ ['/',     "smartchr#loop(' / ', '//', '/')"],
" 			\ ['&',     "smartchr#loop(' & ', ' && ', '&')"],
" 			\ ['%',     "smartchr#loop(' % ', '%')"],
" 			\ ['*',     "smartchr#loop(' * ', '*')"],
" 			\ ['<Bar>', "smartchr#loop(' | ', ' || ', '|')"],
" 			\ [',',     "smartchr#loop(', ', ',')"]]
"
" for i in lst
" 	call smartinput#map_to_trigger('i', i[0], i[0], i[0])
" 	call smartinput#define_rule({ 'char' : i[0], 'at' : '\%#',                                      'input' : '<C-R>=' . i[1] . '<CR>'})
" 	call smartinput#define_rule({'char' : i[0], 'at' : '^\([^"]*"[^"]*"\)*[^"]*"[^"]*\%#',          'input' : i[0]})
" 	call smartinput#define_rule({ 'char' : i[0], 'at' : '^\([^'']*''[^'']*''\)*[^'']*''[^'']*\%#',  'input' : i[0] })
" endfor
"
" call smartinput#define_rule({'char' : '>', 'at' : ' < \%#', 'input' : '<BS><BS><BS><><Left>'})
"
" call smartinput#map_to_trigger('i', '=', '=', '=')
" call smartinput#define_rule({ 'char' : '=', 'at' : '\%#',                                       'input' : "<C-R>=smartchr#loop(' = ', ' == ', '=')<CR>"})
" call smartinput#define_rule({ 'char' : '=', 'at' : '[&+-/<>|] \%#',                             'input' : '<BS>= '})
" call smartinput#define_rule({ 'char' : '=', 'at' : '!\%#',                                      'input' : '= '})
" call smartinput#define_rule({ 'char' : '=', 'at' : '^\([^"]*"[^"]*"\)*[^"]*"[^"]*\%#',          'input' : '='})
" call smartinput#define_rule({ 'char' : '=', 'at' : '^\([^'']*''[^'']*''\)*[^'']*''[^'']*\%#',   'input' : '='})
"
" call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>')
" call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '(\s*)\%#'   , 'input' : '<C-O>dF(<BS>'})
" call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '{\s*}\%#'   , 'input' : '<C-O>dF{<BS>'})
" call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '<\s*>\%#'   , 'input' : '<C-O>dF<<BS>'})
" call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '\[\s*\]\%#' , 'input' : '<C-O>dF[<BS>'})
"
" for op in ['<', '>', '+', '-', '/', '&', '%', '\*', '|']
" 	call smartinput#define_rule({ 'char' : '<BS>' , 'at' : ' ' . op . ' \%#' , 'input' : '<BS><BS><BS>'})
" endfor
" "--------------------------------------------------------------
" "Smartchr,SmartImput Config End
" "--------------------------------------------------------------

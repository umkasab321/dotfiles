command! -nargs=0 RCed call s:editvimrc()
function! s:editvimrc()
		tab new
		edit $MYVIMRC
endfunction

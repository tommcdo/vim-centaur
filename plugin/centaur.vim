" Operator for centering an object on the screen

function! s:center(type, ...)
	if a:0
		let start_line = line("'<")
		let end_line = line("'>")
	else
		let start_line = line("'[")
		let end_line = line("']")
	endif
	let line = line(".")
	let col = col(".")
	let num_lines = end_line - start_line
	if num_lines > winheight(0)
		let new_pos = cursor(start_line, col)
		normal zt
	else
		let middle = start_line + (num_lines / 2)
		let new_pos = cursor(middle, col)
		normal zz
		let new_pos = cursor(line, col)
	endif
endfunction

nnoremap <silent> <Plug>Center :<C-U>set opfunc=<SID>center<CR>g@
vnoremap <silent> <Plug>VCenter :<C-U>call <SID>center(visualmode(), 1)<CR>gv
nmap <silent> gz <Plug>Center
vmap <silent> gz <Plug>VCenter

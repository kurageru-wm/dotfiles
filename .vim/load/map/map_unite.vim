
"Unite
nnoremap <silent> eb :Unite buffer<cr>
nnoremap <silent> ef :UniteWithBufferDir -buffer-name=files file<cr>
nnoremap <silent> ew :Unite -buffer-name=register register<cr>
nnoremap <silent> eq :Unite file_mru<cr>
nnoremap <silent> et :Unite tab<cr>
nnoremap <silent> ec :Unite command<cr>
nnoremap <silent> eo :Unite -no-quit -vertical -winwidth=50 outline<cr>
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

nnoremap <silent> .. :<C-u>Unite -buffer-name=search line/fast -start-insert -no-quit<CR>

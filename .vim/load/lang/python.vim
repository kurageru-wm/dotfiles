"Python
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,preview,longest
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal completeopt-=preview

" jedi web kara copipe
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
autocmd FileType python setlocal completeopt-=preview

" For jedi and neocomplete
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0


" map
au FileType python nnoremap <silent> em :Unite ref/pydoc<cr>
au FileType python nnoremap <silent> ew :NeoComplCacheToggle<CR>
au FileType python setl autoindent
au FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
au FileType python let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"au FileType python set omnifunc=pythoncomplete#Complete

au FileType cs inoremap <C-Enter> <C-j>
au FileType cs imap <buffer> <CR> ;

" vim indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size= 1

"jedi map
nnoremap c <NOP>
let g:jedi#goto_assignments_command = "cg"
let g:jedi#goto_definitions_command = "cd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "cn"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "cr"
let g:jedi#show_call_signatures = "1"

" slime
" Send Text
autocmd FileType python vnoremap <silent> <CR> :SlimeSend<CR>:SlimeSend1 os.popen('slime_all'); os.popen('touch /tmp/slime.py')<CR>
autocmd FileType python nmap <silent> <CR> L<CR>
" Get Doc
autocmd FileType python nnoremap C :SlimeSend1 f=open('/tmp/slime.py', 'w'); f.write(<C-r><C-w>.__doc__); f.close()<CR>:silent !touch /tmp/slime.py<CR>:silent !slime_clear<CR>
" Get Source
autocmd FileType python nnoremap cc :SlimeSend1 f=open('/tmp/slime_tmp.py', 'w'); f.write(sage.misc.sagedoc.my_getsource(<C-r><C-w>, True)); f.close()<CR>:silent !touch /tmp/slime_tmp.py<CR>:silent !slime_clear<CR>:silent tabnew /tmp/slime_tmp.py<CR>
autocmd FileType python nnoremap <Tab> :SlimeSend1 f=open('/tmp/slime_type.py', 'w'); f.write(str(type(<C-r><C-w>))); f.close()<CR>:silent !touch /tmp/slime_type.py<CR>:silent !slime_clear<CR>:!cat /tmp/slime_type.py<CR>

" reload file
set autoread

"Fortran
let fortran_free_source=1
let fortran_fold=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1

"Clojure
autocmd FileType clojure set foldtext=CustomFoldText()
let g:ref_clojure_precode = '(use ''[clojure.repl :only (doc find-doc)])'
au BufNewFile,BufRead *.clj set tags+=$HOME/.tags/clj.tags  

"Gauche
let g:gauref_file='~/.vim/bundle/gauref.vim/doc/gauche-ref.txt'
"GoshREPL
vmap <Space>a <Plug>(gosh_repl_send_block)
let g:gosh_buffer_direction = 'v'


"C/C++
set path =.,/usr/include,/usr/include/GL,/usr/include/GL/internal

"netrw
"let NERDTreeIgnore = ['\.class$', '\~$', '\.out$', '\.pyc$', '\.o$']
let g:netrw_liststyle = 3

"Unite
let g:unite_enable_start_insert=0

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif



" neocompcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_keyword_length  = 1
let g:neocomplcache_temporary_dir = '/tmp/.neocon'
autocmd FileType C setlocal omnifunc=ccomplete#Completes
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'

let g:neocomplcache_dictionary_filetype_lists = {
            \'default' :'',
            \'c' :$HOME.'/.dict/c.dict',
            \'scheme' :$HOME.'/.dict/gauche.dict'
            \}

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"Snippet
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.vim/snippets'

" MISC
" Change current directory.
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
nnoremap <silent> <Space>cd :<C-u>CD<CR>


"Airline
let g:airline#extensions#tabline#enabled = 1

"Quickfix
au QuickfixCmdPost make,grep,grepadd,vimgrep copen


"QuickRun
let g:quickrun_config = {}
let g:quickrun_config.gp = {'command' : 'plot'}
let g:quickrun_config = {
\   "make" : {
\       "command"   : "mingw32-make",
\       "exec" : "%c %o",
\       "outputter" : "error:buffer:quickfix",
\       "runner" : "vimproc",
\   },
\}

" slimv
let g:lisp_rainbow=1 
let g:slimv_ctags="/usr/bin/ctags"
let g:slimv_repl_split=4
let g:slimv_repl_simple_eval=0
"let g:slimv_leader='c'

" easy-motion
let g:EasyMotion_keys='aoeusnth'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1
let g:EasyMotion_special_select_line = 0
let g:EasyMotion_special_select_phrase = 0


"Raibow_parentheses
"au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

au BufRead,BufNewFile *.cheat set filetype=cheat

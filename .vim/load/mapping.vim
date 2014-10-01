"inoremap <C-l> <C-t>
"noremap f e
"noremap F E
"map [ q

"Global
noremap <silent> .( k$/{$<CR>v%zf:noh<CR><ESC>
noremap <silent> .) za
noremap <silent> .fd :set foldcolumn+=1<CR>
noremap <silent> .fi :set foldcolumn+=-1<CR>
nnoremap / /\v
nmap  <C-c> dw

noremap <silent> <C-Right> <ENTER>


"Gauche
au FileType scheme :let is_gauche=1
au FileType scheme set complete+=k~/.vim/dict/gauche.dict
" S-expression fold
au FileType scheme nnoremap <buffer> zp zfab
au FileType scheme nnoremap <buffer> <silent> zP zE:g/ *(define/normal zf%zo<CR><C-o>zR
" move to outer "("
au FileType scheme nnoremap <buffer> <silent> fd hvab<ESC>`<
" move to outer ")"
au FileType scheme nnoremap <buffer> <silent> ff ])
" comment out to ")"
au FileType scheme nnoremap <buffer>
            \ fc vab%<ESC>i#\|<ESC>%a\|#<ESC>``l
au FileType scheme nnoremap <buffer> <silent> \ fC ?#\|<ESC>/(<ESC>vab<ESC>/\|#<ESC>xx`<?#\|<ESC>
au FileType scheme nnoremap <buffer> <silent> fs vab
au FileType scheme nnoremap s %
au FileType scheme inoremap [ +
au FileType scheme inoremap <CR> ?
au FileType scheme inoremap { !
au FileType scheme inoremap ! {
au FileType scheme nnoremap fe i(<ESC>Ea)<ESC>
au FileType scheme nnoremap fj i(<ESC>$a)<ESC>
au FileType scheme nnoremap fk ^i(<ESC>$a)<ESC>
au FileType scheme nnoremap ej o#\| \|#<ESC>hhi 
au FileType scheme nnoremap el i#\| \|#<ESC>hhi 
au FileType scheme nnoremap ek i#\|           \|#<ESC>bbli           
au FileType scheme nnoremap - {
au FileType scheme nnoremap = }
au FileType scheme nnoremap <Space> =
au FileType scheme nnoremap ez 

"Python
au FileType python nnoremap <silent> em :Unite ref/pydoc<cr>
au FileType python nnoremap <silent> ew :NeoComplCacheToggle<CR>
au FileType python setl autoindent
au FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
au FileType python let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
au FileType python set omnifunc=pythoncomplete#Complete
au Filetype java imap <expr> . pumvisible() ? "\<C-E>.\<C-X>\<C-O>\<C-P>" : ".\<C-X>\<C-O>\<C-P>"

au FileType cs inoremap <C-Enter> <C-j>
au FileType cs imap <buffer> <CR> ;

"Java
au FileType java inoremap <C-Enter> <C-j>
au FileType java imap <buffer> <CR> ;

au FileType java :setlocal omnifunc=javacomplete#Complete
au FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo


"PovRay
au FileType pov noremap <silent> ee :!mypov % && mirage %:r.png<cr>


"C/C++
"au FileType c noremap <silent> er :make %:r<cr>
"au FileType cpp noremap <silent> er :make %:r<cr>
au FileType c inoremap <C-Enter> <C-j>
au FileType c imap <buffer> <CR> ;
au FileType cpp inoremap <C-Enter> <C-j>
au FileType cpp imap <buffer> <CR> ;

au FileType c noremap <silent> ee :!\./%:r<cr>
au FileType cpp noremap <silent> ee :!\./%:r<cr>

au FileType c noremap <silent> er :make %:r<cr>
au FileType cpp noremap er :make<cr>

au FileType c set tabstop=2
au FileType cpp set tabstop=2
au FileType c set shiftwidth=2
au FileType cpp set shiftwidth=2

au Filetype c noremap <silent> ej zj
au Filetype c noremap <silent> ek zk
au FileType c noremap <silent> el i/* */<ESC>hhi 

au Filetype cpp noremap <silent> ej zj
au Filetype cpp noremap <silent> ek zk
au FileType cpp noremap <silent> el i/* */<ESC>hhi 

"TeX
au FileType tex noremap <silent> ee :!mt <C-r>%<bs><bs><bs><bs><CR>


"netrw
nmap <silent> en :Vexplore<CR>
nmap <silent> eN :Hexplore<CR>

"Gundo
nnoremap <silent> eu :GundoToggle<cr>

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

"vim-ref
nnoremap <silent> em :Unite ref/man<cr>

" Tab
nnoremap <silent> sj :tabnext<cr>
nnoremap <silent> ss :tabnext<cr>
nnoremap <silent> sk :tabprevious<cr>

" Neosnippet
imap <C-o>     <Plug>(neosnippet_expand_or_jump)
smap <C-o>     <Plug>(neosnippet_expand_or_jump)
xmap <C-o>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
noremap <silent> neos :NeoSnippetEdit<cr>

"Neocomplcache
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><CR> neocomplcache#smart_close_popup()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
noremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"GoshREPL
au FileType scheme nmap <CR> {j^fs<Space>a
au FileType scheme nmap <Tab> ^fs<Space>a

"Quichhl
nmap .m <Plug>(quickhl-toggle)
xmap .m <Plug>(quickhl-toggle)

" MISC
noremap <silent> _ :tabprevious<cr>
noremap <silent> + :tabnext<cr>
noremap <silent> ) <C-w>W
noremap <silent> (  <C-w>w
noremap <silent> <C-w>t :tabnew<cr>
noremap <silent> eh :runtime!syntax/2html.vim<cr>
noremap <silent> er :QuickRun<cr>
xmap <Space>M <Plug>(quickhl-toggle)
nnoremap <silent> .. :<C-u>Unite -buffer-name=search line/fast -start-insert -no-quit<CR>


"Gtags
map .a :Unite -winheight=10 -immediately -default-action=tabopen gtags/context<CR>
map .o :Unite -winheight=10 -immediately -default-action=right gtags/def<CR>

"Alignta
map .= :Alignta 



" Grep(ag)
nnoremap <silent> <C-x> :<C-u>Unite -default-action=tabopen -no-quit grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
nnoremap <silent> <C-j>  :<C-u>UniteResume -default-action=tabopen -no-quit search-buffer<CR>

" Clojure
"au FileType clojure unmap (
"au FileType clojure unmap )
"
"au FileType clojure nmap <silent> - :set hlsearch<CR>
"au FileType clojure nmap <silent> ( :set nohlsearch<CR>?\v(\)\|\(\|]\|[\|}\|\{)<CR>
"au FileType clojure nmap <silent> ) :set nohlsearch<CR>/\v(\)\|\(\|]\|[\|}\|\{)<CR>
"au FileType clojure imap ( ()<ESC>i
"au FileType clojure imap { {}<ESC>i
"au FileType clojure imap [ []<ESC>i
au FileType clojure noremap <C-Tab>  <C-w>w
au FileType clojure nmap  <C-e> :Eval<CR>
au FileType clojure vmap  <C-e> :Eval<CR>
au FileType clojure nmap  <C-a> ys%)
au FileType clojure nmap  <C-c> dw
au FileType clojure nmap  ,m cmm
au FileType clojure map  <Tab> %
au FileType clojure nmap  <C-h> cqp
au FileType clojure nmap  <C-s> :%Eval<CR>
au FileType clojure nmap  <C-d> :Require!<CR>
au FileType clojure nmap  <C-n> :Last<CR>
au FileType clojure nmap  <C-t> :Djump 
au FileType clojure imap <buffer> <CR> <CR>
au FileType clojure imap <C-p> <Plug>clj_repl_uphist.
au FileType clojure imap <C-b> <Plug>clj_repl_downhist.
au FileType clojure nmap <C-m> K
au FileType clojure nmap ccc :Eval!<CR>
au FileType clojure nmap ,e :Eval (clojure.stacktrace/e)<CR>
au FileType clojure nmap ,u :Eval (clojure.repl/pst)<CR>
au FileType clojure nmap <C-j> ,<
au FileType clojure nmap <C-k> ,>
au FileType clojure nmap ,<Space> ,J
au FileType clojure nmap ,o ,O
au FileType clojure nmap  <C-o> ,w(
au FileType clojure vmap  <C-o> ,w(
au FileType clojure nmap ,[ ,w[
au FileType clojure vmap ,[ ,w[
au FileType clojure nmap ,{ ,w{
au FileType clojure vmap ,{ ,w{
au FileType clojure nmap ," ,w"
au FileType clojure vmap ," ,w"
au FileType clojure nmap <buffer> <C-CR> ,S
au FileType clojure nmap ,rr :Eval a<CR>
au FileType clojure nmap ,rh :Eval b<CR>
au FileType clojure nmap  [
au FileType clojure nmap ,t :Eval (run-tests)<CR>
au FileType clojure nmap ,t :Eval (run-tests)<CR>
au FileType clojure nmap ,, :CtrlPBuffer<CR>
au FileType clojure nmap .( )l(jzf
au FileType clojure nmap <silent> ,c :!ctags -f ~/.tags/clj.tags `pwd`<CR><CR>

" redl
au FileType clojure inoremap <C-t> (break)
au FileType clojure inoremap <C-u> (continue)

" Easy-Motion
nmap 'u 's
nmap '' 'w
nmap 'h 'b


" Ctrlp
let g:ctrlp_cmd = 'CtrlPMix'
let g:ctrlp_root_markers = ['.ctrlp']
map ,, :CtrlPBuffer<CR>
map ,. :CtrlPTag<CR>

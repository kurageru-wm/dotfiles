"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/home/krgr/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/krgr/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

"NeoBundle 'gmarik/vundle'
"NeoBundle 'The-NERD-tree'
NeoBundle 'Gundo'
NeoBundle 'quickfixstatus.vim'
NeoBundle 'hier'
NeoBundle 'quickrun.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neosnippet'
"NeoBundle 'hakobe/unite-script'
"NeoBundle 'mattn/mkdpreview-vim'
"NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'tpope/vim-markdown'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'gauref.vim'
"NeoBundle 'info.vim'
NeoBundle 'quickhl.vim'
"NeoBundle 'aharisu/vim_goshrepl'
"NeoBundle 'mitechie/pyflakes-pathogen'
"NeoBundle 'sontek/rope-vim'
"NeoBundle 'VimClojure'
"NeoBundle 'javacomplete'
NeoBundle 'hewes/unite-gtags'
"NeoBundle 'thinca/vim-editvar'
NeoBundle 'ujihisa/unite-launch'
NeoBundle 'bling/vim-airline'
NeoBundle 'h1mesuke/vim-alignta'

"NeoBundle "osyo-manga/unite-quickfix"
"NeoBundle "osyo-manga/shabadou.vim"
"NeoBundle 'bufferlist.vim'
"NeoBundle 'aharisu/Gauche-Complete'
"NeoBundle 'Pydiction'
"NeoBundle 'pythoncomplete'
NeoBundle 'tsukkee/unite-tag'
"NeoBundle 'slimv.vim'
"NeoBundle 'guns/vim-clojure-static'
NeoBundle 'supasorn/vim-easymotion'
"NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/rainbow_parentheses.vim'
" redl $B$NJd405!G=$,=E$$(B
"NeoBundle 'dgrnbrg/vim-redl'
"NeoBundle 'kovisoft/slimv'
NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'ivanov/vim-ipython'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'djoshea/vim-autoread'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

runtime! load**/*.vim

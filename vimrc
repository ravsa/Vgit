filetype off
call pathogen#infect()
call pathogen#helptags()
set laststatus=2
set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
filetype on
nmap <leader>r 22<leader>r
syntax on
vnoremap . :norm.<cr>
let mapleader="\<Space>"
let g:mapleader="\<Space>"
set foldmethod=indent
set foldlevel=30
"save and exit
:map 22 :close! <cr>
:map 33 :w! <cr>
:imap 88 <Esc>-yypA
imap jk <Esc>
map <c-j> <c-w>j
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-l> <c-w>l
:nmap <leader>k :m-2<CR>
:nmap <Leader>j :m+1<CR>
map <leader>v :vnew 
set mat=2
set tabstop=3
set sw=3 "shift width
set expandtab
set ic
set encoding=utf8
set history=1000
set autoread
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc,.*.exe
set ruler
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set smarttab
set ai "auto indent
set si "smart indent
set wrap "wrap lines

"set parenthesis/brackets/etc.:
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i"""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>"

"shifting window size
:map <leader>l <C-w>>
:nmap <leader>l <C-w>>
:map <leader>h <C-w><
:nmap <leader>h <C-w><
:nmap <leader>m <C-w>+
:map <leader>m <C-w>+

"Github plugin
:source ~/.vim/git.vim
:map <F2> :call Initialize() <cr>
:nmap <F2> :call Initialize() <CR>
:imap <F2> <Esc> :call Initialize() <CR>
:map <F3> :call Commit() <CR>
:nmap <F3> :call Commit() <CR>
:imap <F3> <Esc> :call Commit() <CR>
:map <F4> :call Push() <CR>
:nmap <F4> :call Push() <CR>
:imap <F4> <Esc> :call Push() <CR>
:map <F12> :call Reset() <cr>
:imap <F12> <Esc> :call Reset() <cr>
:nmap <F12> :call Reset() <cr>
map <leader>g :GundoToggle<CR>
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

map <leader>n :NERDTreeToggle<CR>

let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:pep8_map='<leader>8'
filetype plugin on
filetype indent on
:colorscheme desert

"bash shell keys
:nmap <C-a> <Home>
:nmap <C-e> <End>
:imap <C-a> <Home>
:imap <C-e> <End>
:map <C-a> <Home>
:map <C-e> <End>
func! Python()
   :abbr phw print "Hello,World!"
   set complete+=k~/.vim/pykey.txt
endfunc
func! Bash()
   :abbr phw echo "Hello,World!"
endfunc
autocmd filetype python :call Python()
autocmd filetype sh :call Bash()
let g:autopep8_disable_show_diff=1

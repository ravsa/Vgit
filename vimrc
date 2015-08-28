"leader set
let mapleader=","
let g:mapleader=","

"save and exit
:imap <F8> <Esc> :w!<CR>
:nmap <F8> :w!<CR>
:map <F8> :w! <CR>
:imap <F7> <Esc> :q!<CR>
:nmap <F7> :q!<CR>
:map <F7> :q! <CR>

"bash shell keys
:nmap <C-a> <Home>
:nmap <C-e> <End>
:imap <C-a> <Home>
:imap <C-e> <End>
:map <C-a> <Home>
:map <C-e> <End>

"moving lines
:nmap <C-k> :m-2<CR>
:nmap <C-j> :m+1<CR>
:vmap <C-k> :m'>+1<CR>'<m
:vmap <C-j> :m'<-2<cr>'>m

"set some properties
set nocompatible
syntax enable
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
set mat=2
set tabstop=3
set sw=3 "shift width
set expandtab
set background=dark
set smarttab
set ai "auto indent
set si "smart indent
set wrap "wrap lines

"trailing white space
autocmd BufWritePre * :%s/\s\+$//e

"command for root permission
command W w !sudo tee % > /dev/null
:map <F9> :W <CR>
:imap <F9> <Esc>:W <CR>
:nmap <F9> :W <CR>

"filetype plugins
filetype off
filetype plugin indent on

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

"set compilers and debuggers
function! Python()
      set omnifunc=pythoncomplete
      :imap <F5> <Esc> :w!<CR>:!clear;python %<CR>
      :nmap <F5> :w!<CR>:!clear;python %<CR>
      :map <F5>  :w!<CR>:!clear;python %<CR>
      :imap <F10> <Esc> :w!<CR>:!clear;python3.4 %<CR>
      :nmap <F10> :w!<CR>:!clear;python3.4 %<CR>
      :map <F10>  :w!<CR>:!clear;python3.4 %<CR>
      :imap <F6> <Esc> :w!<CR>:!clear;pdb %<CR>
      :nmap <F6> :w!<CR>:!clear;pdb %<CR>
      :map <F6>  :w!<CR>:!clear;pdb %<CR>
   endfunction
function! Bash()
      set omnifunc=shcomplete
      :imap <F5> <Esc> :w!<CR>:!clear;chmod +x %;./%<CR>
      :nmap <F5> :w!<CR>:!clear;chmod +x %;./%<CR>
      :map <F5>  :w!<CR>:!clear;chmod +x %;./%<CR>
      :imap <F6> <Esc> :w!<CR>:!clear;bash -x %<CR>
      :nmap <F6> :w!<CR>:!clear;bash -x %<CR>
      :map <F6>  :w!<CR>:!clear;bash -x %<CR>
   endfunction
function! Cpp()
      set omnifunc=cppcomplete
      :imap <F5> <Esc> :w!<CR>:!clear;g++ -g -W % && ./a.out<CR>
      :nmap <F5> :w!<CR>:!clear;g++ -g -W % && ./a.out<CR>
      :map <F5>  :w!<CR>:!clear;g++ -g -W % && ./a.out<CR>
      :imap <F6> <Esc> :w!<CR>:!clear;gdb a.out<CR>
      :nmap <F6> :w!<CR>:!clear;gdb a.out<CR>
      :map <F6>  :w!<CR>:!clear;gdb a.out<CR>
   endfunction
function! C()
      set omnifunc=ccomplete
      :imap <F5> <Esc> :w!<CR>:!clear;gcc -g -W % && ./a.out<CR>
      :nmap <F5> :w!<CR>:!clear;gcc -g -W % && ./a.out<CR>
      :map <F5>  :w!<CR>:!clear;gcc -g -W % && ./a.out<CR>
      :imap <F6> <Esc> :w!<CR>:!clear;gdb a.out<CR>
      :nmap <F6> :w!<CR>:!clear;gdb a.out<CR>
      :map <F6>  :w!<CR>:!clear;gdb a.out<CR>
   endfunction
function! Html()
      set omnifunc=htmlcomplete
      :imap <F5> <Esc> :w!<CR>:!clear;firefox %<CR>
      :nmap <F5> :w!<CR>:!clear;firefox %<CR>
      :map <F5>  :w!<CR>:!clear;firefox %<CR>
   endfunction
autocmd filetype python :call Python()
autocmd filetype sh :call Bash()
autocmd filetype c :call C()
autocmd filetype cpp :call Cpp()
autocmd filetype html :call Html()
autocmd filetype javascript :call Html()

"new window and bash shell
:map <leader>n :new <cword> <cr>
:map <leader>v :vnew <cword> <cr>
:map <leader>t :!bash<CR>

"status line
au insertenter * hi StatusLine ctermfg=darkblue
au insertleave * hi StatusLine ctermfg=darkgrey
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Col:\ %c

"shifting window size
:map <C-l> <C-w>>
:nmap <C-l> <C-w>>
:map <C-h> <C-w><
:nmap <C-h> <C-w><
:nmap <c-m> <C-w>+
:map <c-m> <C-w>+

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


"tabs
:nmap T :tabedit
:nmap B :tabn <cr>

"Themes
func! Theme0()
   :silent colorscheme default |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme default') |silent wq!
endfunc
func! Theme1()
   :silent colorscheme evening |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme evening') |wq
endfunc
func! Theme2()
   :silent colorscheme morning |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme morning') |wq
endfunc
func! Theme3()
   :silent colorscheme desert |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme desert') |wq
endfunc
func! Theme4()
   :silent colorscheme shine |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme shine') |wq
endfunc
func! Theme5()
   :silent colorscheme torte |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme torte') |wq
endfunc
func! Theme6()
   :silent colorscheme zellner |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme zellner') |wq
endfunc
func! Theme7()
   :silent colorscheme ron |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme ron') |wq
endfunc
func! Theme8()
   :silent colorscheme elflord |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme elflord') |wq
endfunc
func! Theme9()
   :silent colorscheme slate |:new ~/.vim/theme.vim |:$-1 |:delete |:call append(1,'colorscheme slate') |wq
endfunc
:map ` :call Theme0()<cr>
:map 1 :call Theme1()<CR>
:map 2 :call Theme2()<CR>
:map 3 :call Theme3()<cr>
:map 4 :call Theme4()<cr>
:map 5 :call Theme5()<cr>
:map 6 :call Theme6()<cr>
:map 7 :call Theme7()<cr>
:map 8 :call Theme8()<cr>
:map 9 :call Theme9()<cr>
:source ~/.vim/theme.vim
:call Theme()

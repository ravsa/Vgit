if !has('python')
   finish
endif

function! Setup()
   :!clear;python ~/.vim/setup.py
   :redraw!
endfunction

function! Initialize()
   if finddir(".git",'.')!=".git"
      :call Setup()
      :silent !clear;python ~/.vim/init.py
      :redraw!
   endif
endfunction

function! Commit()
   :w!
   :pyfile ~/.vim/track.py
   :!clear;python ~/.vim/commit.py
   :redraw!
endfunction

function! Push()
   :pyfile ~/.vim/push.py
   :redraw!
endfunction

function! Reset()
   :pyfile ~/.vim/reset.py
endfunction

function! For_i()
   let str="for(int i=0;i<N;i++){"
   :call append(line("."),str)
   :call append(line(".")+1,"")
   let str="}"
   :call append(line(".")+2,str)|:.+2
endfunc!
function! For_j()
   let str="for(int j=0;j<N;j++){"
   :call append(line("."),str)
   :call append(line(".")+1,"")
   let str="}"
   :call append(line(".")+2,str)|:.+2
endfunc!
function! For_k()
   let str="for(int k=0;k<N;k++){"
   :call append(line("."),str)
   :call append(line(".")+1,"")
   let str="}"
   :call append(line(".")+2,str)|:.+2
endfunc!
function! For_x()
   let str="for(int x=0;x<N;x++){"
   :call append(line("."),str)
   :call append(line(".")+1,"")
   let str="}"
   :call append(line(".")+2,str)|:.+2
endfunc!
function! For_y()
   let str="for(int y=0;y<N;y++){"
   :call append(line("."),str)
   :call append(line(".")+1,"")
   :call append(line(".")+2,"}")|:.+2
endfunc!
function! While()
   let str="while() { "
   :call append(line("."),str)
   :call append(line(".")+1,"")
   :call append(line(".")+2,"}")|:.+1
   :call cursor(line("."),7)
endfunc!
function! Max()
   let str="int max(int a,int b){"
   :call append(line("."),str)
   let str="return a>b?a:b }"
   :call append(line(".")+1,str)
endfunc!
function! Min()
   let str="int min(int a,int b){"
   :call append(line("."),str)
   let str="return a>b?b:a }"
   :call append(line(".")+1,str)
endfunc!
function! Gcd()
   let str="int gcd(int a,int b){"
   :call append(line("."),str)
   let str="if (b>a) return gcd(b,a);"
   :call append(line(".")+1,str)
   let str="if (a%b==0) return b;"
   :call append(line(".")+2,str)
   let str="return gcd(b,a%b);}"
   :call append(line(".")+3,str)
endfunc!
function! Lcm()
   let str="int lcm(int a,int b){"
   :call append(line("."),str)
   let str="return (a*b)/gcd(b,a);}"
   :call append(line(".")+1,str)
endfunc!
function! Cpp_comp()
   if empty(glob(expand("%p")))
      let str="#include<iostream>"
      :call append(line("."),str)
      let str="using namespace std;"
      :call append(line(".")+1,str)
      let str="int main(){"
      :call append(line(".")+2,str)
      :call append(line(".")+3,"")
      let str="return 0;}"
      :call append(line(".")+4,str)
      :1d
      :call cursor(line("$")-1,4)
   endif
endfunc!
function! C_comp()
   if empty(glob(expand("%p")))
      let str="#include<stdio.h>"
      :call append(line("."),str)
      let str="int main(){"
      :call append(line(".")+1,str)
      :call append(line(".")+2,"")
      let str="return 0;}"
      :call append(line(".")+3,str)
      :1d
      :call cursor(line("$")-1,4)
endif
endfunc!

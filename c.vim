" setl mp=gcc\ -Wall\ %\ -o\ %:h:h/bin/%:t:r

" The 'fdiagnostics-color=auto' caused problems when compiling on cygwin.
" This was previously se
" Changed it to setl so it's only set via through c files
setl mp=gcc\ -fdiagnostics-color=auto\ -Wall\ %\ -o\ %:h:h/bin/%:t:r
com! -b Makef !make -C %:h:h
com! -b Run !./%:h:h/bin/%:t:r

"se mp=gcc\ -Wall\ -Wall\ %\ -o\ %:r
com! -b Makef !make -C %:h:h
com! -b Run !./%:h:h/bin/%:t:r
"com! -b Run !./%:r
"setl ts=8
"setl sw=8
"setl sts=0
"setl noet

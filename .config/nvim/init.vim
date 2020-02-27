call plug#begin('~/.vim/plugged')
Plug 'https://github.com/Townk/vim-autoclose.git'
call plug#end()

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number

map <F11> :!g++ q.cpp <ENTER>
map <F12> :!./a.out < input <ENTER>
map <F10> :w<ENTER>
map <F9> :!cat input<ENTER>

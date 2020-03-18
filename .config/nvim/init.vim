call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'preservim/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number

map <F2> :NERDTreeToggle<CR>
map <F11> :!g++ q.cpp 2> error<CR>
map <F12> :!./a.out < input > output 2> error<CR>

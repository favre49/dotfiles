" Handle plugins with Vim-Plug.
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'preservim/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

" Tab Behavior.
set tabstop=8
set softtabstop=0
set expandtab 
set shiftwidth=4
set smarttab

" Changes I can't live without.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set ruler

" Change leader key.
let mapleader = ","

" Make searching good.
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Use Leader+Space to clear search.
nnoremap <leader><space> :noh<cr>

" Remap Tab to match brackets.
nnoremap <tab> %
vnoremap <tab> %

" Handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1

" YCM settings.
let g:ycm_autoclose_preview_window_after_completion = 1

" Remap ; to : so that I don't waste more time
nnoremap ; :

" Strip all trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Turn NERDTree on or off
map <F2> :NERDTreeToggle<CR>

" Keybindings for competitive programming
function Compete()
    echom "Setting competitive programming keybinds"
    set makeprg=make\ %<
    noremap <buffer> <leader>m :make<CR>:botright copen<CR><CR>
    noremap <buffer> <leader>r :!%:p:r < input<cr>
    echom "Set competitive programming keybinds. Good luck!"
endfunction


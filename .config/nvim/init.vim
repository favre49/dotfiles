"Handle plugins with Vim-Plug.
call plug#begin('~/.vim/plugged')

" Helps comment quickly.
Plug 'preservim/nerdcommenter'

" Need that auto-pairing.
Plug 'raimondi/delimitmate'

" Extremely helpful file view
Plug 'preservim/nerdtree'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '/home/favre49/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 

" A git wrapper so awesome it shouldn't be legal
Plug 'tpope/vim-fugitive'

" Better searching
Plug 'mileszs/ack.vim'

" Markdown support
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" LaTeX support
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'output',
\}

" For writing
Plug 'junegunn/goyo.vim'

" Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Plug 'honza/vim-snippets'

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

" Set language
set spelllang=en_gb

" Use Leader+Space to clear search.
nnoremap <leader><space> :noh<cr>

" Remap Tab to match brackets.
nnoremap <tab> %
vnoremap <tab> %

" Handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1

" Remap ; to : so that I don't waste more time
nnoremap ; :

" Strip all trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Turn NERDTree on or off
map <F2> :NERDTreeToggle<CR>

" NERDCommenter keymappings
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

" Easy escape
inoremap jk <Esc>
inoremap kj <Esc>

" Fast semicolons
inoremap ;; <C-o>A;

" Call .md files Markdown files
"autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" If it's a Markdown file, let's load the Markdown keybindings
"autocmd FileType markdown :call Markdown()

" If it's a LaTex file, let's load the LaTeX keybindings
autocmd Filetype latex,tex :call LaTeX()

" Keybindings for competitive programming
function Compete()
    set makeprg=make\ %<
    noremap <buffer> <leader>m :make<CR>:botright copen<CR><CR>
    noremap <buffer> <leader>r :!%:p:r < input<cr>
    echom "Set competitive programming keybinds. Good luck!"
endfunction

" Keybindings for Markdown Note-taking
function Markdown()
    setlocal spell

    " Automatically update on change
    autocmd TextChanged,TextChangedI <buffer> silent update

    " Automatically compile markdown files
    noremap <silent> <buffer> <leader>m :!pandoc %:p -o %:r.pdf<CR><CR>

    " Open markdown files in zathura
    noremap <silent> <buffer> <leader>r :!zathura %:r.pdf &<CR><CR>
endfunction

" Keybindings for LaTex Note-taking
function LaTeX()
    " Automatically update on change
    autocmd TextChanged,TextChangedI <buffer> silent update

    " Spell check
    setlocal spell
endfunction

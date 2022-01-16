-- Neovim API aliases
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

g.mapleader = ',' -- Change leader to comma
opt.mouse = 'nv' -- Enable mouse support
opt.swapfile = false -- Don't use a swapfile

-- General Settings
opt.number = true
opt.relativenumber = true
opt.showmode = true
opt.showmatch = true
opt.hidden = true
opt.ttyfast = true
opt.scrolloff = 3
opt.visualbell = true
opt.laststatus = 2
opt.backspace = 'indent,eol,start'
opt.wrap = true
opt.formatoptions = 'qrn1'
opt.spelllang='en_gb'

-- Better search
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.incsearch = true
opt.hlsearch = true

-- Tab and Indentation settings
opt.tabstop = 2
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 2
opt.smarttab = true

-- Fix indentation for C++ lambda functions
vim.api.nvim_command('autocmd BufEnter *.cpp :setlocal cindent cino=j1,(0,ws,Ws')

-- LaTeX Configuration
g.tex_flavor = 'latex'
g.vimtex_view_method = 'zathura'
g.vimtex_quickfix_open_on_warning = 0
g.Tex_BibtexFlavor = 'biber'
vim.api.nvim_command('autocmd Filetype latex,tex :setlocal spell')

-- Map :W to :w, while still allowing :Windows from fzf.vim
-- https://github.com/junegunn/fzf.vim/issues/1084
vim.api.nvim_command('command! -nargs=* W w')

-- Spell correction for Markdown files
vim.api.nvim_command('autocmd Filetype markdown :setlocal spell')

-- Color scheme
opt.termguicolors = true
g.tokyonight_style = "night"
cmd[[colorscheme tokyonight]]


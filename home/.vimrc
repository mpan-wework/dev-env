set history=10000
set laststatus=2
set number
set ruler

syntax on
filetype on

set autoindent
set cindent
set smartindent
set tabstop=2
set softtabstop=2
set expandtab
set smarttab

set showmatch
set nohls
set hlsearch
set incsearch

" ================================================================
" Plugins
" ================================================================

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" nerdtree
set mouse=a

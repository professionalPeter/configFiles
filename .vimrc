set shell=bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'davidoc/taskpaper.vim'

" vim-scripts repos
"Plugin 'L9'
Plugin 'Logcat-syntax-highlighter'

" non-GitHub repos
"Plugin 'git://git.wincent.com/command-t.git'

" Git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///Users/gmarik/path/to/plugin'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
inoremap jk <ESC>
" This doesn't work form the terminal right now because the terminal
" intercepts the control-S
nnoremap <C-s> :w<CR>
set ruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set number
syntax on
syntax enable
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
" Solarized stuff
"let g:solarized_termtrans = 1
"set background=light
"colorscheme solarized

" Lucius color scheme
colorscheme lucius

"set background=dark
"colorscheme slate

" Setting to make Logcat-syntax-highlighter work
au BufRead,BufNewFile *.logcat set filetype=logcat
nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

let mapleader = " "

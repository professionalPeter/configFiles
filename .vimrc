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
"Plugin 'tpope/vim-fugitive'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'tpope/vim-rsi'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'jonathanfilip/vim-lucius'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mitsuse/autocomplete-swift'
Plugin 'keith/swift.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sillybun/vim-repl'

" vim-scripts repos
"Plugin 'L9'
Plugin 'git-time-lapse'

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

" This doesn't work from the terminal right now because the terminal
" intercepts the control-S
nnoremap <C-s> :w<CR>

" Shortcut to go from Terminal mode to Normal mode
tnoremap jk <C-\><C-n>

set ruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set number
syntax on
syntax enable
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" Solarized stuff
"let g:solarized_termtrans = 1
"set background=light
"colorscheme solarized

" Lucius color scheme
"colorscheme lucius

"set background=dark
"colorscheme slate

let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
let g:repl_program = {
			\	"default": "zsh",
			\	"python": "/Users/peter.lewis/anaconda3/bin/python",
			\	}
let g:repl_exit_commands = {
			\	"python": "exit()",
			\	"bash": "exit",
			\	"zsh": "exit",
			\	"default": "exit()",
			\	}
let mapleader = " "

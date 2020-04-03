" For a paranoia. ;;
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

" Minimal settings, can be redundant
filetype plugin indent on
syntax on

" Download vim-plug if not already downloaded
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Sensible defaults everyone can agree on
Plug 'tpope/vim-sensible'

" precision color scheme for multiple applications (terminal, vim, etc.) with both dark/light modes
Plug 'altercation/vim-colors-solarized'

"
Plug 'tpope/vim-unimpaired'

call plug#end()

" clipboard         Set clipboard provider
set clipboard+=unnamedplus

" relative number   Adds relative line numbering on the lefthand side
set relativenumber

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When on uses space instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" colorscheme       Sets favorite colorscheme
" syntax            Use filewise syntax highlighting
" background        Choose dark/light version of the color scheme
syntax          enable
set background =dark
colorscheme     solarized

" <leader>          Custom leader key mapping
map <leader>   ='\'

nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>w :w<cr>

inoremap {<cr> {<cr>}<esc>O<tab>


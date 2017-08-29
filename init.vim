set nocompatible
let mapleader = ','

set rtp+=~/.vim/dein/repos/github.com/Shougo/dein.vim " path to dein.vim

" runtime! custom_preconfig/*.vim
runtime! common_config/*.vim
" runtime! custom_config/*.vim

" for git, add spell checking and automatic wrapping at 72 columns
autocmd Filetype gitcommit setlocal spell textwidth=72

colorscheme gruvbox
set background=dark

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'yggdroot/indentline'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'joshdick/onedark.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'cespare/vim-toml'


call vundle#end()            " required
filetype plugin indent on    " required
syntax enable

colorscheme onedark

inoremap jk <esc>
set tabstop=4 shiftwidth=4 expandtab
set relativenumber nu
set t_ut=

let g:vim_json_conceal = 0
let g:SuperTabDefaultCompletionType = "<c-n>"

" stop using arrow keys!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

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
Plugin 'airblade/vim-gitgutter'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'habamax/vim-godot'
Plugin 'sheerun/vim-polyglot'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'dense-analysis/ale'

call vundle#end()
filetype plugin indent on
syntax enable

colorscheme onedark

" Set tab width to 4
set tabstop=4 shiftwidth=4 expandtab
" Show relative line numbers instead of absolute
set relativenumber nu
set t_ut=
set updatetime=300
set cmdheight=2
" Set folding on
set foldmethod=syntax
" Set clipboard to sysyem clipboard
set clipboard=unnamedplus

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
au FileType ocaml call SuperTabSetDefaultCompletionType("<c-x><c-o>")

let g:coc_global_extensions = ['coc-json', 'coc-prettier', 'coc-rust-analyzer', 'coc-tsserver', 'coc-omnisharp']

let g:vim_json_conceal = 0
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

" Make NERDTree show hidden file
let NERDTreeShowHidden=1

let mapleader = ","

" jk to escape insert mode 
inoremap jk <esc>

" Coc shortcuts
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)

" stop using arrow keys!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Telescope related
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Split changing without C-W Direction, directly C-Direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Exit terminal mod with esc
tnoremap <Esc> <C-\><C-n>

" ,ne to open NERDTree
nmap <leader>ne :NERDTree<cr>
" ,nt to toggle NERDTree
nmap <leader>nt :NERDTreeToggle<cr>

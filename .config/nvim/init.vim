set nocompatible
filetype off

call plug#begin(stdpath('data') . '/plugged')

" AUTOCOMPLETE :
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'cespare/vim-toml'                                " Add toml syntax highlithing
Plug 'yggdroot/indentline'                             " Add a line for indentation size
" Plug 'ervandew/supertab'                               " For autocompletion ?
Plug 'scrooloose/nerdtree'                             " File tree
Plug 'Xuyuanp/nerdtree-git-plugin'                     " Adds file modifications in nerdTree
Plug 'tpope/vim-fugitive'                              " Best GIT plugin for vim ?
Plug 'airblade/vim-gitgutter'                          " Show git diffs in files
Plug 'sheerun/vim-polyglot'                            " ? I Think it adds syntax highlighting for a lot of languages
Plug 'vim-airline/vim-airline'                         " Line on the bottom for showing various informations
Plug 'evanleck/vim-svelte', {'branch': 'main'}         " Syntax highlighting for svelte
Plug 'ryanoasis/vim-devicons'                          " Icons for NERDTree
Plug 'Chiel92/vim-autoformat'                          " AutoFormat
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'lervag/vimtex'                                   " LaTeX Support

" BUFFERLINE
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'jacoborus/tender.vim'

call plug#end()

filetype plugin indent on
syntax enable

" colorscheme molokai
" colorscheme challenger_deep
colorscheme tender

" Set tab width to 4
set tabstop=4 shiftwidth=4 expandtab
" Show relative line numbers instead of absolute
set relativenumber nu
set t_ut=
set updatetime=300
set cmdheight=2
" Set folding on
set foldmethod=syntax
" Set clipboard to system clipboard
set clipboard+=unnamedplus
" For bufferline
set termguicolors
" Disable folding on file open
set foldlevelstart=999

let g:vim_json_conceal = 0
let g:SuperTabDefaultCompletionType = "<c-n>"
" Make NERDTree show hidden file
let NERDTreeShowHidden=1
" Set Coc Extensions
let g:coc_global_extensions = ['coc-json', 'coc-rust-analyzer', 'coc-go', 'coc-tsserver', 'coc-svelte', 'coc-css', 'coc-pyright', 'coc-omnisharp', 'coc-cmake', 'coc-clangd']
" :Explore better style
let g:netrw_liststyle = 3

let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 0

" Disable vimtex concealing
let g:vimtex_syntax_conceal_disable = 1

" Config for neovide:
let g:neovide_cursor_vfx_mode = "railgun"
set guifont=FiraCode\ Nerd\ Font\ Mono:style=Medium,Regular:h12

let mapleader = ","

"" </ Bufferline config

lua << EOF
require("bufferline").setup {
    options = {
        show_close_icon = false,
        diagnostics = "coc",
    }
}
EOF
nnoremap <silent> gl :BufferLineCycleNext<CR>
nnoremap <silent> gh :BufferLineCyclePrev<CR>
nnoremap <silent> gp :BufferLinePick<CR>
nnoremap <silent> gb :BufferLinePickClose<CR>
nnoremap <silent> gch :BufferLineCloseLeft<CR>
nnoremap <silent> gcl :BufferLineCloseRight<CR>
nnoremap <silent> gcf :BufferLineCloseRight<CR> :BufferLineCloseLeft<CR>

"" /> End of bufferline config

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

" jk to escape insert mode 
inoremap jk <esc>

" Lanuage servers shortcuts
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
" ,p to run Prettier (in async mode)
nmap <Leader>p <Plug>(PrettierAsync)

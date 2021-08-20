" plugins
" =========
call plug#begin(stdpath('data') . '/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-unimpaired'
Plug 'patstockwell/vim-monokai-tasty'
call plug#end()

let NERDTreeChDirMode=2
let NERDTreeIgnore=['node_modules']
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=3
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='monokai_tasty'
let g:vim_monokai_tasty_italic = 1
let $FZF_DEFAULT_COMMAND = 'rg --files'

lua << EOF
require'lspconfig'.gopls.setup{}
EOF

" configuration
" =============

set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set ignorecase smartcase
set nobackup nowritebackup
set hidden

set gdefault
set clipboard=unnamedplus

set scrolloff=1
" when scrolling horizontally, keep cursor centered
set sidescrolloff=99999

set noshowmode
set number
set termguicolors

autocmd ColorScheme * highlight Normal guibg=None
autocmd ColorScheme * highlight Vertsplit guibg=#6c6d69
colorscheme vim-monokai-tasty

" don't show pipes in window border
set fillchars=vert:\ 

" keys
" =============

let mapleader=' '

map ; :

nnoremap <Leader>s :update<CR>

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>

nnoremap <C-p> :Files<CR>

" commands
" =============

" exit when only the sidebar is left open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



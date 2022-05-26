call plug#begin('~/.config/nvim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'itchyny/lightline.vim'
call plug#end()

set number relativenumber
set termguicolors
set mouse=a
set hidden
set nowrap
set noswapfile
set nobackup
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set scrolloff=8
set colorcolumn=80
set cursorline
set incsearch
set nohlsearch
set ignorecase
set smartcase
set smartindent
set noshowmode
set signcolumn=number
set autoread

let mapleader = " "

let g:lightline = { 'colorscheme': 'gruvbox' }

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"nnoremap <leader>p :Files<CR>
"nnoremap <C-p> :GFiles<CR>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE


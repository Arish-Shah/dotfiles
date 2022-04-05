call plug#begin('~/.config/nvim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
call plug#end()

set number relativenumber
set termguicolors
set mouse=a
set hidden
set nowrap
set noswapfile
set nobackup
set tabstop=2 softtabstop=2
set expandtab
set shiftwidth=2
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

let g:lightline = { 'colorscheme': 'catppuccin' }

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>p :Files<CR>
nnoremap <C-p> :GFiles<CR>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

colorscheme catppuccin

hi Normal guibg=NONE ctermbg=NONE

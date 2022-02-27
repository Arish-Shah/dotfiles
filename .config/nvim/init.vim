call plug#begin('~/.config/nvim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'norcalli/nvim-colorizer.lua'
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
set clipboard+=unnamedplus

lua require'colorizer'.setup()

let mapleader = " "

let g:lightline = { 'colorscheme': 'gruvbox' }

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>f :Files<CR>
nnoremap <leader>p :GFiles<CR>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

colorscheme gruvbox
hi Normal guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none

" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
call plug#end()

" setters
set mouse=a
set hidden
set number
set relativenumber
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
set noshowmode
set clipboard+=unnamedplus

let mapleader = " "

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ }

" remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>f :Files<CR>
nnoremap <leader>p :GFiles<CR>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-s> :w<CR>

colorscheme gruvbox

set mouse=a
set hidden
set number
set relativenumber
set noswapfile
set nobackup
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set scrolloff=8
set colorcolumn=80
set cursorline
set nohlsearch
set ignorecase
set smartcase

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme gruvbox

let mapleader = " "

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

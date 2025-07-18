syntax on 

colorscheme koehler
set number
set relativenumber

" ctrl-s to save 
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" ctrl-q to quit 
inoremap <C-q> <esc>:q<cr>
nnoremap <C-q> :q<cr>

" ctrl-z to undo 
inoremap <C-z> <esc>:u<cr>a
nnoremap <C-z> :u<cr>

" cursor block and line
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" sets sapcing to 4 
set shiftwidth=4 
set tabstop=4

set scrolloff=20

set nowrap 

set cursorline
highlight CursorLine guibg=#2a2a2a guifg=NONE

" search hilighting display 
set incsearch

set clipboard+=unnamedplus

" ingore capital letters druing search 
set ignorecase
set smartcase 

set showcmd

set showmatch

set hlsearch 

set history=1000

set wildmenu

set wildmode=list:longest

set termguicolors

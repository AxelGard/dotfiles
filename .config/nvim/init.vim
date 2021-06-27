" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

"hjkl
"ctrl + u -> scroll up
"ctrl + d -> scroll down
"H -> top of screen
"M -> middle of screen
"L -> bottom of screen
"number + G -> move to line number in file
"Combine numbers with commands to be more effecient for exapmle 20j, 20k or 3x
"gg -> beginning of file
"G -> end of file

"f + character -> find first character on current line
"F + character -> find first character on current line (backwards)
"t + character -> find first character on current line and place 1 before it
"t + character -> find first character on current line and place 1 before it (backwards)
"ci + character -> changes contents between character for example ci'
"x -> cut character
"r -> replace character with some other
"G -> bottom of the file
"o -> opens a new line below
"O -> open a new line above
"e -> end of the word
"a -> append text to the right of current character
"A -> append text at the end of the current line
"g_ -> move to the last non empty character
"w -> move forward one word
"b -> move back one word
"ddp -> moves line down
"dd2kp -> moves line up
"/ -> searh for pattern
"%s/search/replace/g -> replaces all occurenses of some pattern
"n / N for moving matches
". -> repeats the previous editing command
"dd -> deletes current line
"cd -> deletes current line and puts into insert mode
"dw -> deletes word
"cw -> deletes word and puts into insert mode
"v -> visual mode
"V -> visual line mode
"ctrl + v -> visual block mode
"Ctrl+v -> move up down -> shift + i -> type character -> Esc -> wait 1 sec -> insert character on multiple lines

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot' "WARNING: Gives red lines on whitespaces!?

Plug 'vim-airline/vim-airline'

Plug 'Raimondi/delimitMate'

Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

Plug 'easymotion/vim-easymotion'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
source $HOME/.config/nvim/plug-config/coc.vim
"C++: https://codevion.github.io/#!vim/coc.md

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

Plug 'psliwka/vim-smoothie'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }



call plug#end()

luafile $HOME/.config/nvim/lua/plug-colorizer.lua
"lua require'colorizer'.setup()
filetype plugin on

" Colorscheme
let g:airline_theme = 'onedark'
colorscheme onedark
set background=dark
"let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let mapleader = "\<Space>"
let maplocalleader = "\\"

"split navigations
set splitbelow
set splitright

" Enable folding
"set foldmethod=indent
"set foldlevel=99

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |

set encoding=utf-8

syntax on

" Dont show error on whitespace
let g:python_highlight_space_errors = 0

" startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Code',
            \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0


let g:startify_custom_header = [
	 \ '                                            __',
	 \ '                                           / _)',
	 \ '          _  __     _             _.----._/ /',
         \ '         / |/ /  __(_)_ _        /         /',
         \ '        /    / |/ / /  ` \    __/ (  | (  |',
         \ '       /_/|_/|___/_/_/_/_/   /__.-|_|--|_|',
         \]

" air-line
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Git
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


nmap <leader>gK 9999<leader>gk

highlight Comment cterm=italic gui=italic

set laststatus=2
set showtabline=2

" true colours
set t_Co=256

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

set nu rnu " relative line numbering
set clipboard=unnamedplus " public copy/paste register
set ruler
set showcmd
set noswapfile " doesn't create swap files
set noshowmode
set shortmess+=c
set omnifunc=syntaxcomplete#Complete
set mouse=a
set hidden

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F2> " enable paste mode

set wildmenu "graphical auto complete menu
set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searches

" clears highlights
nnoremap // :noh<return>
" moves current line down or up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkp
" open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" WARNING: Pref use ctrl + z to pause session then use fg
" open terminal in vertical split
nnoremap <leader>i :vsplit term://bash<cr>
" fzf opens windows in insert mode but should be normal
nnoremap <leader>sv :source $MYVIMRC<cr>
" enable or disable line wrapping in current buffer
nnoremap <buffer> <localleader>w :set wrap!<cr>
" nerdtree
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>p :Files<cr>
" easymotion
" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap f <Plug>(easymotion-overwin-f2)

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>


" TAB in general mode will move to next buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" SHIFT-q will close current buffer
nnoremap <S-q> :bd<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" It allows <C-hjkl> to move around in windows, regardless of terminal status, but I can still use <C-jk> to navigate fzf windows.
if has('nvim')
  augroup vimrc_term
    autocmd!
    autocmd WinEnter term://* nohlsearch
    autocmd WinEnter term://* startinsert

    autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
    autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
    autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
    autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
    autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
  augroup END
endif

" using https://github.com/junegunn/fzf.vim & fzf installed.
augroup vimrc_term_fzf
  autocmd!
  " Do some other stuff independent of nvim.
  if has('nvim')
    autocmd FileType fzf tunmap <buffer> <Esc>
    autocmd FileType fzf tunmap <buffer> <C-h>
    autocmd FileType fzf tunmap <buffer> <C-j>
    autocmd FileType fzf tunmap <buffer> <C-k>
    autocmd FileType fzf tunmap <buffer> <C-l>
  endif
augroup END

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

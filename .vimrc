set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" " required! 
Plugin 'VundleVim/Vundle.vim'
"
" " The bundles you install will be listed here
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'valloric/youcompleteme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'heavenshell/vim-pydocstring'
"
call vundle#end()
filetype plugin indent on
"
" " The rest of your config follows here

" " Leader
let mapleader = ","
let maplocalleader = "\\"


augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" Airline setup
set laststatus=2
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\:h12
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_theme='solarized'
  let g:airline_powerline_fonts = 1
  let g:Powerline_symbols = 'fancy'
  let g:Powerline_cache_enabled = 1
  let g:Powerline_colorscheme = 'solarized'

" Activate NERDTree with F2
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.o$', '\~$']

" Python-mode
" Keys:
" K             Show python docs
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" Documentation
let g:pymode_doc = 1 
let g:pymode_doc_key = 'K'
let g:pydoc = 'pydoc'

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" Disable syntax checking
let g:pymode_lint = 0
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0

" Don't autofold code
let g:pymode_folding = 0

" YouCompleteMe
" YCM doesn't like homebrew python...
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" Gets rid of the preview buffer asap
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>

"YCM virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_enable_baloon = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_java_checkers = ['javac']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_style_error_symbol = 'E>'
let g:syntastic_style_warning_symbol = 'W>'
let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "active_filetypes": [],
            \ "passive_filetypes": ['java', 'html', 'rst']
            \ }
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'

nnoremap <leader>C :SyntasticCheck<cr>

" Basic options
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set cursorline
set hidden
set visualbell
set ttyfast
set number
set ruler
set backspace=indent,eol,start
set norelativenumber
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1
set showmatch
set noundofile
set incsearch " search as characters are entered
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Tabs, spaces, wrapping
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1j
set colorcolumn=+1

" Color scheme
syntax on
set background=dark
colorscheme solarized

" Enable mouse mode for scrolling
if has("mouse")
  set mouse=a
endif

" Save when losing focus
au FocusLost * :silent! wall
"
" " Resize splits when the window is resized
au VimResized * :wincmd =

" Enable backup
set nobackup
set noswapfile
set nowritebackup

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful way to manage tabs
map <leader>tn :tabnew
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" easier moving of code blocks
" Try to go into visual mode (v), then select several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

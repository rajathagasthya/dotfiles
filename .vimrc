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
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'valloric/youcompleteme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'fatih/vim-go'

" Install fzf plugin and point to existing fzf binary
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'
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

" Workaround for https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

" YouCompleteMe
" YCM doesn't like homebrew python...
let g:ycm_path_to_python_interpreter = '/usr/local/opt/python@2/bin/python'
" Gets rid of the preview buffer asap
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>p :YcmCompleter GoTo<CR>
nnoremap <leader>pd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>pf :YcmCompleter GoToDefinition<CR>

"YCM virtualenv support
py3<< EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, 'rb').read(), activate_this, 'exec'),
    dict(__file__=activate_this))
EOF

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_enable_baloon = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers = ['javac']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
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

" Move between tabs
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>tl :tabnext<CR>

" Go to tab by number
noremap <leader>t1 1gt
noremap <leader>t2 2gt
noremap <leader>t3 3gt
noremap <leader>t4 4gt
noremap <leader>t5 5gt
noremap <leader>t6 6gt
noremap <leader>t7 7gt
noremap <leader>t8 8gt
noremap <leader>t9 9gt
noremap <leader>t0 :tablast<cr>

" easier moving of code blocks
" Try to go into visual mode (v), then select several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

"during insert, kj escapes, `^ is so that the cursor doesn't move
inoremap kj <Esc>`^
"during insert, lkj escapes and saves
inoremap lkj <Esc>`^:w<CR>
"during insert, lkj escapes and saves and QUITS
inoremap lkjh <Esc>:wq<CR>

" Map fzf to ctrl-p
nnoremap <C-p> :Files<Cr>
" Add rg capabilities with fzf to search for text
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" Map rg command to ctrl-o
nnoremap <C-f> :Rg<Cr>

" vim-go configuration
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_fmt_command = "goimports"

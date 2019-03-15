"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/pedramos/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/pedramos/.cache/dein')
  call dein#begin('/home/pedramos/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/pedramos/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })
  
  ""custom
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('scrooloose/nerdtree')
    "call dein#add('lepture/vim-jinja')
    "call dein#add('altercation/vim-colors-solarized')
    "call dein#add('jnurmine/Zenburn')
    "call dein#add('morhetz/gruvbox') 
    "call dein#add('plasticboy/vim-markdown') 
    "call dein#add('rust-lang/rust.vim')
    "call dein#add('fatih/vim-go')
    call dein#add('majutsushi/tagbar')
    call dein#add('vim-pandoc/vim-pandoc')
    call dein#add('vim-pandoc/vim-pandoc-syntax')
    call dein#add('dhruvasagar/vim-table-mode')
    "call dein#add('morhetz/gruvbox')
    call dein#add('arcticicestudio/nord-vim')

    " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------



set number
"let python_highlight_all=1
"let python_space_error_highlight = 0
   let python_no_builtin_highlight = 1
   let python_no_doctest_code_highlight = 1
   let python_no_doctest_highlight = 1
   let python_no_exception_highlight = 1
   let python_no_number_highlight = 1

"python template
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.py 0r ~/.config/nvim/templates/py_template.py
  augroup END
endif

set clipboard+=unnamedplus
set autoindent
set ts=4
set expandtab
set shiftwidth=4
set sts=4
set smarttab
set showmatch

set t_Co=256
"color desert
"colorscheme solarized
"colorscheme  zenburn
"colorscheme gruvbox
set background=dark
set termguicolors

set background=dark
set termguicolors
let g:nord_italic=1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord


set guicursor=
set cursorline
set lazyredraw

set incsearch           " search as characters are entered
set hlsearch            " highlight matches


let mapleader=","       " leader is comma

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

""airline config

"let g:airline_theme='solarized'
let g:airline_theme='nord'
"let g:airline_theme='zenburn'

let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline_detect_whitespace=0
let g:airline_section_warning=' '
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1

set ttimeoutlen=10
set noshowmode


"nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


let g:vim_markdown_auto_extension_ext = 'md'
let g:vim_markdown_folding_disabled=1
set nofoldenable

let g:go_version_warning = 0

nmap <F8> :TagbarToggle<CR>


" buffers
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
nnoremap <leader>bd :bd<CR>

let g:tagbar_ctags_bin = '/usr/bin/uctags'

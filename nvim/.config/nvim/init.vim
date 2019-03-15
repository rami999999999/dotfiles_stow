"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/pedramos/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/pedramos/.config/nvim/dein')
  call dein#begin('/home/pedramos/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/pedramos/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
  
  "deoplete for auto-completion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('mdempsky/gocode', {'rtp': 'nvim/'})
  "Ale for Linting
  call dein#add('w0rp/ale')
  
  call dein#add('tbastos/vim-lua')
  call dein#add('neovim/nvimdev.nvim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
    
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })
  
  ""theming
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('scrooloose/nerdtree')
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('morhetz/gruvbox') 
    call dein#add('majutsushi/tagbar')

    call dein#add('lepture/vim-jinja')
    call dein#add('rust-lang/rust.vim')
    call dein#add('fatih/vim-go')
    call dein#add('vim-perl/vim-perl')

    "utils
    call dein#add('pbrisbin/vim-mkdir')
    call dein#add('junegunn/goyo.vim')
    call dein#add('junegunn/limelight.vim')
    call dein#add('vim-pandoc/vim-pandoc')
    call dein#add('vim-pandoc/vim-pandoc-syntax')
    call dein#add('godlygeek/tabular')
    "call dein#add('plasticboy/vim-markdown')
    
    call dein#add('arcticicestudio/nord-vim',{'branch':'develop'})
    call dein#add('lervag/vimtex')
    call dein#add('zchee/deoplete-go')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('davidhalter/jedi-vim')
    call dein#add('sebastianmarkow/deoplete-rust')
    call dein#add('fszymanski/deoplete-emoji')
    call dein#add('Shougo/deoplete-clangx')
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
set rtp+=/usr/local/opt/fzf


set number
set breakindent
set breakindentopt=shift:1
set showbreak=↪\
set linebreak
set colorcolumn=90


" Python stuff
" =================
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

    "let python_highlight_all=1
    "let python_space_error_highlight = 0
    let python_no_builtin_highlight = 1
    let python_no_doctest_code_highlight = 1
    let python_no_doctest_highlight = 1
    let python_no_exception_highlight = 1
    let python_no_number_highlight = 1


" C stuff
" =============
au BufNewFile,BufRead *.c
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" Markdown stuff
" =================
au BufNewFile,BufRead *.md
    \ :Goyo |
    \ set filetype=markdown  
    "\ :!/home/pedramos/.config/nvim/bin/preview.sh % & 

    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
    let g:vim_markdown_auto_extension_ext = 'md'
    let g:vim_markdown_folding_disabled=1
    set nofoldenable


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

let g:airline_powerline_fonts=1
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


let g:go_version_warning = 0

nmap <F8> :TagbarToggle<CR>


" buffers
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
nnoremap <leader>bd :bd<CR>
let deoplete#enable_at_startup=1

let g:tagbar_ctags_bin = '/usr/bin/uctags'

let g:jedi#completions_enabled = 0

"let g:go_fmt_command='goimports'
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let g:ale_perl_perlcritic_showrules = 1


" Goyo config
" ============

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  set filetype=markdown
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  "Limelight
  
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
"Limelight!
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
map <C-N> :FZF<CR>

map <F2> :ls<CR>:b<Space>

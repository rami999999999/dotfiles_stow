if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let g:ale_completion_enabled=1
    
if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.local/share/nvim/plugged')
  "deoplete for auto-completion
  Plug 'Shougo/deoplete.nvim'
  Plug 'mdempsky/gocode', {'rtp': 'nvim/'}
  "Ale for Linting
  Plug 'w0rp/ale'
  
  Plug 'tbastos/vim-lua'
  Plug 'neovim/nvimdev.nvim'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
    
  Plug 'Shougo/deol.nvim', { 'rev': 'a1b5108fd' }
  
  ""theming
    Plug 'rhysd/vim-color-spring-night'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree'
    Plug 'altercation/vim-colors-solarized'
    Plug 'morhetz/gruvbox' 
    Plug 'drewtempelmeyer/palenight.vim'
    " Nice icons
    Plug 'ryanoasis/vim-devicons'    
    
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Identation guides for better visualization
    Plug 'Yggdroot/indentLine'

    Plug 'majutsushi/tagbar'

    Plug 'lepture/vim-jinja'
    Plug 'rust-lang/rust.vim'
    "Plug 'fatih/vim-go'
    "Plug 'vim-perl/vim-perl'
    Plug 'neomake/neomake'
    "utils
    Plug 'pbrisbin/vim-mkdir'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-rmarkdown'
    Plug 'godlygeek/tabular'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    Plug 'arcticicestudio/nord-vim',{'branch':'develop'}
    Plug 'lervag/vimtex'
    Plug 'zchee/deoplete-go'
    Plug 'zchee/deoplete-jedi'
    Plug 'davidhalter/jedi-vim'
    Plug 'sebastianmarkow/deoplete-rust'
    Plug 'fszymanski/deoplete-emoji'
    Plug 'Shougo/deoplete-clangx'
    Plug 'deathlyfrantic/deoplete-spell'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ } 
call plug#end()



let g:LanguageClient_autoStart = 1


let g:ale_enabled = 1
let g:ale_sign_error = '✖︎'
highlight ALEErrorSign guifg=red ctermfg=red
let g:ale_sign_warning = '✔︎'
highlight ALEWarningSign guifg=grey ctermfg=grey
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:move_key_modifier = 'N'
"let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_enter = 1
"let g:ale_lint_on_save = 1
"let g:ale_perl_perl_options = '-c -Mwarnings -Ilib'
let g:ale_type_map = {
\ 'perlcritic': {'ES': 'WS', 'E': 'W'},
\}

let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang/'
let g:clang_complete_auto = 1


" let g:ale_sign_column_always = 1                " ale enabled
"let g:ale_sign_column_always = 1
let g:ale_completion_enabled=1
let g:ale_fix_on_save = 1
let g:ale_linters = {'c':['clang','clang-tidy'],'perl':['perltidy'],'python':['flake8'],'go':['gofmt'],'rust':['rls']}
let g:ale_fixers = {'perl':['perltidy'],'c':['clang-format'],'python':['autopep8'],'go':['gofmt'],'rust':['rustfmt']}
let g:airline#extensions#ale#enabled = 1

let g:ale_c_clangformat_options="-style Mozilla"

nmap <silent> <C-Up> <Plug>(ale_previous_wrap)
nmap <silent> <C-Down> <Plug>(ale_next_wrap)



set rtp+=/usr/local/opt/fzf

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

set number
set breakindent
set breakindentopt=shift:1
set showbreak=↪\
set linebreak
set colorcolumn=90
set mouse=a


" Latex styff
" ============
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


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
    "let python_no_builtin_highlight = 1
    "let python_no_doctest_code_highlight = 1
    "let python_no_doctest_highlight = 1
    "let python_no_exception_highlight = 1
    "let python_no_number_highlight = 1


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
    \ set nofoldenable | 
    let g:pandoc#after#modules#enabled = ["neosnippet","deoplete"]

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

let g:spring_night_high_contrast=0
let g:spring_night_highlight_terminal=1

"colorscheme nord
colorscheme spring-night
let g:airline_theme = 'spring_night'
set guicursor=
"let g:airline_theme='nord'
set cursorline

set incsearch           " search as characters are entered
set hlsearch            " highlight matches


let mapleader=","       " leader is comma

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"airline config
"=================
"let g:airline_theme='solarized'
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
"============
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


let g:go_version_warning = 0

nmap <F8> :TagbarToggle<CR>


" buffers management
" ====================
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
nnoremap <leader>bd :bd<CR>

" Other config
" =============

let deoplete#enable_at_startup=1

let g:tagbar_ctags_bin = '/usr/bin/uctags'

let g:jedi#completions_enabled = 0

let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

let g:ale_perl_perlcritic_showrules = 1


" Goyo config
" ============

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  Limelight
  
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
Limelight!
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" buffers
"============
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" FZF
" =============

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
nnoremap <silent> <Leader>n :FZF<CR>

map <F2> :ls<CR>:b<Space>



"packages needed for vim
" autopep8
" gofmt
" fzf
" clang
nnoremap <silent> <Leader>p :! pandoc % -o %.pdf && pkill -HUP mupdf<CR>

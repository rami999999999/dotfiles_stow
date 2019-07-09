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
  
  ""theming
    Plug 'rhysd/vim-color-spring-night'
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree'
    " Nice icons
    Plug 'ryanoasis/vim-devicons'    
    
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Yggdroot/indentLine'

    "utils
    Plug 'pbrisbin/vim-mkdir'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-rmarkdown'
    Plug 'godlygeek/tabular'
call plug#end()





set rtp+=/usr/local/opt/fzf

set number
set breakindent
set breakindentopt=shift:1
set showbreak=↪\
set linebreak
set colorcolumn=80
set mouse=a



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
let g:spring_night_high_contrast=0
let g:spring_night_highlight_terminal=1

colorscheme spring-night
set guicursor=
set cursorline

set incsearch           " search as characters are entered
set hlsearch            " highlight matches


let mapleader=","       " leader is comma

nnoremap <leader><space> :nohlsearch<CR>

set ttimeoutlen=10
set noshowmode


"nerdtree
"============
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" buffers management
" ====================
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
nnoremap <leader>bd :bd<CR>

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




hi! Conceal guifg=lightblue ctermfg=lightblue

set hidden




if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.local/share/nvim/plugged')

    
    Plug 'junegunn/goyo.vim'
    Plug 'rhysd/vim-color-spring-night'
    Plug 'morhetz/gruvbox' 

call plug#end()


set breakindent
set breakindentopt=shift:1
set showbreak=↪\
set linebreak
set colorcolumn=90
set mouse=a

set guicursor=


set clipboard+=unnamedplus
set autoindent
set ts=4
set expandtab
set shiftwidth=4
set sts=4
set smarttab
set showmatch

let g:spring_night_kill_bold=1
let g:spring_night_high_contrast=0
let g:spring_night_highlight_terminal=1

set t_Co=256
"color desert
"colorscheme solarized
"colorscheme  zenburn
colorscheme gruvbox
set background=dark
set termguicolors



set cursorline

set incsearch           " search as characters are entered
set hlsearch            " highlight matches


let mapleader=","       " leader is comma

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


set ttimeoutlen=10
set laststatus=1


set spell

set filetype=mail


" Goyo config
" ============

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
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
au BufNewFile,BufRead * Goyo

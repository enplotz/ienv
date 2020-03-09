set nocompatible
filetype plugin on
syntax off
set mouse=a
set clipboard=unnamed

set showmode
set ruler
set laststatus=2

set ttimeoutlen=30
set timeoutlen=700
set lazyredraw
set ttyfast

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

set shiftwidth=4
set tabstop=4
set softtabstop=4

set hlsearch incsearch

set listchars=tab:▸\ ,eol:¬
set list
set wrap
set showbreak=↪ " Visualize wrapped lines when wrap toggled
"set guifont=Fura\ Code\ Retina\ Nerd\ Font\ Complete\ 14
set guifont=JetBrains\ Mono\ 14

""" From :h xterm-true-color and :h termguicolors
if &term =~# '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif

set cursorline
set termguicolors
colorscheme onehalflight

set nocompatible
filetype plugin on

""" speed tweaks
set ttimeoutlen=30
set timeoutlen=700
set lazyredraw
set ttyfast

""" Persistent undos
if has('persistent_undo')
  call system('mkdir ~/.vim/undos')
  set undodir=~/.vim/undos
  set undofile
  set undolevels=3000
  set undoreload=10000
endif

""" spacing and shifting
set wrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set shiftround

""" misc
set laststatus=2        " always show status bar
set relativenumber      " line numbers
" set showmatch           " Show matching brackets
" set matchtime=5         " Bracket blinking
set hlsearch incsearch  " search highlight
set wildmenu            " menu for commands
set list
set hidden              " keep undo history / dont remove buffers
set directory=$HOME/.vim/swapfiles//
set rtp+=~/.fzf

set splitright
set splitbelow

set backspace=indent,eol,start

""" List chars
set listchars=""
set listchars=tab:\ \
set listchars+=trail:·
set listchars+=tab:»·
set listchars+=extends:>
set listchars+=precedes:<
set showbreak=↪ " Visualize wrapped lines when wrap toggled

augroup golang
    autocmd BufRead *.go set nolist
augroup END

""" folding
set foldenable
set foldmethod=syntax
set foldlevelstart=3
set foldnestmax=4

set guifont=Fura\ Code\ Retina\ Nerd\ Font\ Complete\ 14

""" colors please
syntax enable
set cursorline
set background=dark

"try

  """ From :h xterm-true-color and :h termguicolors
  if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  else
    let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
    let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  endif

  set termguicolors


  " https://github.com/lifepillar/vim-solarized8#options
  "let g:solarized_termtrans=1
  "colorscheme solarized8_high

  " https://github.com/morhetz/gruvbox
  " gruvbox config
  let g:gruvbox_italic=1
  let g:gruvbox_contrast_dark='hard'
  let g:gruvbox_contrast_light='hard'
  colorscheme gruvbox

  hi StatusLine term=none cterm=none
  hi MatchParen cterm=bold ctermbg=none ctermfg=red

  " Makes the background transparent. Leave these out if you're not using a transparent
  " terminal.
  highlight Normal ctermbg=NONE guibg=NONE
  highlight NonText ctermbg=NONE guibg=NONE
"catch
"  " do nothing
"endtry

""" auto complete
set completeopt=longest,menuone,preview
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

""" remappings
nnoremap <leader><space> :nohlsearch<CR>  " clear search highlight
nnoremap z za                             " simpler folding toggle

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
noremap J :bn<cr>
noremap K :bp<cr>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" automatics
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

autocmd FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

    " set the CN (column number) symbol:
"autocmd VimEnter * let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])




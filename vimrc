" Section: General Settings {{{

set nocompatible
set t_Co=16
call pathogen#infect()
set nowrap
set nohlsearch
set backspace=indent,eol,start
set nobackup
set showmatch
syntax on
set ruler
set showcmd
set modelines=1
set ff=unix
set ffs=unix,dos
set sw=2 sts=2 ts=2 et
set bg=dark
"colorscheme solarized

set colorcolumn=80
"set cursorline

" }}}

" Section: SLIME {{{

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "slime:1.0"}
let g:slime_no_mappings = 1
let g:slime_python_ipython = 1

" }}}

" Section: Airline {{{

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" }}}

" Section: Indentation {{{

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif
  augroup END
  autocmd FileType xml set sw=2 sts=2 ts=2 et
  autocmd FileType html set sw=2 sts=2 ts=2 et
  autocmd FileType python set sw=2 sts=2 ts=2 et
  autocmd FileType c set sw=2 sts=2 ts=2 et
  autocmd FileType cpp set sw=2 sts=2 ts=2 et
  autocmd FileType lisp set sw=2 sts=2 ts=2 et
  autocmd FileType html set ft=htmldjango
  autocmd FileType hs set sw=2 sts=2 ts=2 et
else
  set autoindent
endif

" }}}

" Section: Folding {{{

set foldenable
set foldlevelstart=99
set foldnestmax=10

set foldmethod=indent

" }}}

" Section: Shortcuts {{{

let mapleader = ","

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Normal Mode
nmap <leader>n :set invnumber<CR>
nnoremap <space> za
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nmap <leader>p <Plug>SlimeParagraphSend
nmap <leader>cs <Plug>SlimeConfig
nmap <leader>ss <Plug>SlimeLineSend
nmap <leader>s <Plug>SlimeMotionSend

" Insert Mode
inoremap jj <esc>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Visual Mode
xmap <leader>s <Plug>SlimeRegionSend

" }}}
" vim:foldmethod=marker:foldlevel=0

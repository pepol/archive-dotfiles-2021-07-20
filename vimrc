" Section: General Settings {{{

set nocompatible
set t_Co=256
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

let g:easytags_events = ['BufWritePost']

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

" Section: Syntastic {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_quiet_messages = { "type": "style" }

let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_erlang_checkers = ['erlang']
let g:syntastic_java_checkers = ['javac']

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

nmap <leader>t :TagbarToggle<CR>
nmap <leader>tu :UpdateTags<CR>

nmap <leader>eo :Errors<CR>
nmap <leader>ec :lclose<CR>

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

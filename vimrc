set nocompatible
set nowrap
set nohlsearch
set backspace=indent,eol,start
set nobackup
syntax on
set ruler
set showcmd
set ff=unix
set ffs=unix,dos
set sw=2 sts=2 ts=2 et
set bg=dark

let mapleader = ","

nmap <C-N><C-N> :set invnumber<CR>

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

function! Browser ()
  let line = getline(".")
  let line = matchstr(line, "\%(http://\|www\.\)[^ ,;\t]*")
  exec "!firefox ".line
endfunction
map <leader>w :call Browser()<CR>

let g:powerline_pycmd='py3'
set number
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set encoding=utf-8
let g:airline_powerline_fonts = 1 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
" set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2


set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set laststatus=2

" Toggle paste
set pastetoggle=<F3>

syntax enable
" colorscheme base16-default-dark

set foldmethod=syntax

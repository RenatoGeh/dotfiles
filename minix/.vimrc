set tabstop=2
set shiftwidth=2
set expandtab

set backspace=indent,eol,start
set t_Co=8

syntax on
set number

set colorcolumn=100

colorscheme evening

set encoding=utf-8

set nowrap

execute pathogen#infect()

filetype plugin indent on

" Fixes airline only showing up on >1 panes.
set laststatus=2

" Syntastic's configs.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Sets :Sw as write sudo write
command! -nargs=0 Sw w !sudo tee % > /dev/null

" Remap Ctrl+ArrowKeys to switch buffers.
nnoremap <C-Up> :bn<CR>
nnoremap <C-Down> :bp<CR>

" Clipboard yanking.
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Clipboard pasting.
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Airline stuff.
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ":t"
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_powerline_fonts=1

" Sets syntastic to use C++0x/11"
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Sets airline symbols

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '<U+1F512>'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

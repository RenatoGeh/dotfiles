" vim-plug

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Disable LaTeX-Box for use with vim-tex.
let g:polyglot_disabled = ['latex']

call plug#begin('~/.config/nvim/plugged')
" Add plugins manually here.

" vim-misc
Plug 'https://github.com/xolox/vim-misc.git'
" Color Switcher
"Plug 'https://github.com/xolox/vim-colorscheme-switcher.git'
" Vim-obsession (session saver).
Plug 'https://github.com/tpope/vim-obsession.git'
" Tagbar
Plug 'https://github.com/majutsushi/tagbar.git'
" Tmuxline
Plug 'https://github.com/edkolev/tmuxline.vim.git'
" Promptline
Plug 'https://github.com/edkolev/promptline.vim.git'
" Localvimrc
Plug 'https://github.com/embear/vim-localvimrc.git'
" Tender colorscheme
Plug 'jacoborus/tender'
" Deoplete
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
" Neomake
Plug 'neomake/neomake'
" Haxe syntax
Plug 'jdonaldson/vaxe'
" Startify
Plug 'mhinz/vim-startify'
" vim-cpp-enhanced-highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
" C syntax highlighting
Plug 'justinmk/vim-syntax-extra'
" My own version of vim-latex-live-preview
"Plug 'RenatoGeh/vim-latex-live-preview'
" vim-tex
Plug 'lervag/vimtex'
" vim-go
Plug 'fatih/vim-go'
" suda.vim
Plug 'lambdalisue/suda.vim'
" OmniCppComplete
Plug 'vim-scripts/OmniCppComplete'
" Python syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Airline
Plug 'vim-airline/vim-airline'
" NerdCommenter
Plug 'scrooloose/nerdcommenter'
" Polyglot
Plug 'sheerun/vim-polyglot'
" Gundo
Plug 'sjl/gundo.vim'
" Fugitive
Plug 'tpope/vim-fugitive'
" Git-Gutter
Plug 'airblade/vim-gitgutter'
" vim-markdown-preview (my own fixes)
Plug 'RenatoGeh/vim-markdown-preview'
" Stan Highlighting
Plug 'eigenfoo/stan-vim'
" Rust
Plug 'rust-lang/rust.vim'
" Automatic buffer length
Plug 'tpope/vim-sleuth'
" Julia
Plug 'JuliaEditorSupport/julia-vim'
" Julia ctags
Plug 'JuliaEditorSupport/julia-ctags'

call plug#end()

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Auto refresh
set autoread

set nowrap

"set termguicolors

" Airline stuff.
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'

" Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ":t"
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'

" Tmuxline
let g:airline#extensions#tmuxline#enabled = 0

let g:airline#extensions#branch#enabled = 1

" Local vimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0

syntax enable

set colorcolumn=100

set nu
set showcmd
set showmatch
set showmode


" Neovim change
"set t_Co=8

"set termguicolors
" colorscheme tango2
" colorscheme wombat256mod
" colorscheme cleanphp
" colorscheme darkblue2
colorscheme freya
let g:colorscheme_switcher_define_mappings = 0
"colorscheme tender

"let g:tender_airline = 1
"let g:airline_theme = 'tender'

" Neovim ESC issues.
"if ! has('gui_running')
    "set ttimeoutlen=10
    "augroup FastEscape
        "autocmd!
        "au InsertEnter * set timeoutlen=0
        "au InsertLeave * set timeoutlen=1000
    "augroup END
"endif

"set nottimeout

" Neovim change
"set encoding=utf-8

set guifont=Sauce\ Code\ Powerline\ Regular
let g:airline_powerline_fonts=1

" Sets syntastic to use C++0x/11"
"let g:syntastic_cpp_compiler_options = ' -std=c++11'

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

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
"let g:airline#extensions#syntastic#enabled = 1
let g:neomake_airline = 1

let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'

" Tabs
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ":t"
let g:airline#extensions#tabline#show_tab_type = 1

" Tmuxline
let g:airline#extensions#tmuxline#enabled = 0

" Sets :Sw as write sudo write
command! -nargs=0 Sw w suda://%

" Tmux color fix
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Term emulator: ESC to command mode.
tnoremap <Esc> <C-\><C-n>

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

" Remap start/end of line
nnoremap B ^
nnoremap E $

" Tabs
au FileType * set softtabstop=2
au FileType * set tabstop=2
au FileType * set shiftwidth=2
set expandtab

" Scroll offset
set scrolloff=5

set autoread

" Breakline at 100
set textwidth=99

" Cursor line
set cursorline
hi CursorLine term=bold cterm=bold
"set cursorcolumn
"hi CursorColumn term=bold cterm=bold

" Autocomplete for normal mode
set wildmenu

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Persistent undos
set noswapfile
set nobackup
set nowritebackup
if !&diff
  set undodir=~/.vim/undodir
  set undofile
endif

" Tagbar
nmap <leader>g :TagbarToggle<CR>

" Visual block
nnoremap q <c-v>

" Disable Rubocop for Neomake.
  "return ['mri', 'rubocop', 'reek', 'rubylint']
let g:neomake_ruby_enabled_makers = ['mri']

" Mutt text flow
"setlocal fo+=aw

" Syntax highlighting for faq-script.
"au BufNewFile,BufRead *.faq set filetype=markdown
" Syntax highlighting for SageMath.
"augroup filetypedetect
  "au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
"augroup END

" Deoplete
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim
let g:deoplete#enable_at_startup = 1
"call deoplete#enable()

" Neomake
"autocmd! BufWritePost * Neomake
call neomake#configure#automake('w')
let g:neomake_open_list = 2
let g:neomake_chktex_maker = {
      \ 'exe': 'chktex',
      \ 'args': ['-l ~/Vim/neomake/chktexrc.local', '-n 18'],
      \ 'errorformat': '%f:%l:%c: %m',
      \ }
let g:neomake_tex_enabled_makers = ['chktex']
" Gets rid of annoying 'no test files' warning.
"let g:neomake_go_maker = {
  "\ 'args': [
      "\ '-c',
  "\ ],
  "\ 'append_file': 0,
  "\ 'cwd': '%:h',
  "\ 'serialize': 1,
  "\ 'serialize_abort_on_error': 1,
  "\ 'errorformat':
      "\ '%W%f:%l: warning: %m,' .
      "\ '%E%f:%l:%c:%m,' .
      "\ '%E%f:%l:%m,' .
      "\ '%C%\s%\+%m,' .
      "\ '%-G#%.%#',
  "\ 'postprocess': function('neomake#postprocess#compress_whitespace'),
  "\ }

" C
let g:neomake_c_enabled_makers = ['gcc']
let g:neomake_c_gcc_args = ['-Wextra', '-Wall']
"let g:neomake_c_clangtidy_args = ['--']

" C++
let g:neomake_cpp_enabled_makers = ['gcc']
let g:neomake_cpp_gcc_args = ['-Wextra', '-Wall']

" Python
let g:neomake_python_enabled_makers = ['python']

" LaTeX Live Preview
let g:livepreview_previewer = 'zathura'

" GoMetaLinter
let g:neomake_go_enabled_makers = ['go']

" Hard tabs on Makefiles.
@neovim.autocmd FileType make setlocal noexpandtab
@neovim.autocmd BufNewFile,BufRead Makefile setlocal noexpandtab

" C++ completion
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.cc,*.hh set omnifunc=omni#cpp#complete#Main
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/boost
set tags+=~/.vim/tags/curl
set tags+=~/.vim/tags/libircclient
set tags+=~/.vim/tags/libxml2
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extras=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" vim-tex neovim support.
let g:vimtex_compiler_progname = 'nvr'

" vim-tex previewer with zathura.
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_use_temp_files = 1

" vim-tex disable warnings.
let g:vimtex_quickfix_latexlog = {'default' : 0}

" vim-tex shell escape.
let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \ '-pdf',
      \ '-shell-escape',
      \ '-verbose',
      \ '-file-line-error',
      \ '-synctex=1',
      \ '-interaction=nonstopmode',
      \ ],
      \ }

" vim-tex misc
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=2

" Email format
au FileType email set textwidth=60

" Edit multiple files.
command! -complete=file -nargs=+ Edit call s:ETW('edit', <f-args>)
command! -complete=file -nargs=+ Evs call s:ETW('vnew', <f-args>)
command! -complete=file -nargs=+ Esplit call s:ETW('new', <f-args>)
function! s:ETW(what, ...)
  for f1 in a:000
    let files = glob(f1)
    if files == ''
      execute a:what . ' ' . escape(f1, '\ "')
    else
      for f2 in split(files, "\n")
        execute a:what . ' ' . escape(f2, '\ "')
      endfor
    endif
  endfor
endfunction

command! -range VS call setpos('.', [0,<line1>,0,0]) |
                    \ exe "normal V" |
                    \ call setpos('.', [0,<line2>,0,0])

" Startify + NERDTree
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                "\ |   NERDTree
                \ |   wincmd w
                \ | endif

" Vim-go
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

highlight Normal ctermbg=black

" Trailing whitespaces
" Taken from https://github.com/bronson/vim-trailing-whitespace
if exists('loaded_trailing_whitespace_plugin') | finish | endif
let loaded_trailing_whitespace_plugin = 1

if !exists('g:extra_whitespace_ignored_filetypes')
    let g:extra_whitespace_ignored_filetypes = []
endif

function! ShouldMatchWhitespace()
    for ft in g:extra_whitespace_ignored_filetypes
        if ft ==# &filetype | return 0 | endif
    endfor
    return 1
endfunction

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNew * if ShouldMatchWhitespace() | match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/ | else | match ExtraWhitespace /^^/ | endif

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * if ShouldMatchWhitespace() | match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/ | endif
autocmd InsertEnter * if ShouldMatchWhitespace() | match ExtraWhitespace /\\\@<![\u3000[:space:]]\+\%#\@<!$/ | endif

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\\\@<!\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" lvimrc blacklist
let g:localvimrc_blacklist='/home/renatogeh/Documents/ta/mac0318/gym/.lvimrc'

" vim-markdown-preview
let g:vim_markdown_preview_toggle=2
let g:vim_markdown_preview_browser='firefox'
let g:vim_markdown_preview_pandoc=1
let g:vim_markdown_preview_use_xdg_open=1

" Rust
let g:rustfmt_autosave = 1


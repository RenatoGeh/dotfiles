" vim-plug

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

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

call plug#end()

""
"" Janus setup
""

" Define paths
if has('win32') || has('win64') || has('win32unix')
  let g:janus_path = escape(expand("~/.vim/janus/vim"), ' ')
  let g:janus_vim_path = escape(expand("~/.vim/janus/vim"), ' ')
else
  let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
  let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
endif
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

" .vimrc.after is loaded after the plugins have loaded

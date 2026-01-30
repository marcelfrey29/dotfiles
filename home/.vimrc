" Plugins via vim-plug (https://github.com/junegunn/vim-plug) 
" Install vim-plug if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Add vim-plug
call plug#begin()

" Plugins with `Plug 'name'`
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

" General
set mouse=a " Enable mouse support

" Editor
set number
set cursorline
set nowrap
set tabstop=4
set shiftwidth=4
set autoindent

" Search
set ignorecase " Case-insensitive search
set smartcase " Case-sensitive search when uppercase is present
set hlsearch " Highlight search results

" Theme
colorscheme default
set background=dark
syntax on
highlight LineNr cterm=NONE ctermfg=249 ctermbg=NONE
highlight CursorLineNr cterm=bold ctermfg=75 ctermbg=8
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=8

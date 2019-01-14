set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/screen'
Plugin 'vim-syntastic/syntastic'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-scripts/upAndDown'
Plugin 'pangloss/vim-javascript'

" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'

" colors
Plugin 'jpo/vim-railscasts-theme'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader=','

set nonumber

" snipmate settings
let g:snips_author = "Matthew Wright"
let g:snips_email = "matt@wrighters.net"
let g:snips_github = "https://github.com/wrighter"

" syntastic settings
let g:syntastic_python_checkers = ['flake8', 'pydocstyle']
" ui stuff
colorscheme railscasts

"set guifont=Andale\ Mono\ 8
"set guifont=Andale\ Mono\ 9
"set guifont=M+\ 1mn\ Medium\ 8
set guifont="Inconsolata Medium 10"
"set guifont=Monaco:h10
"set guifont="Anonymous Pro 12"

set omnifunc=syntaxcomplete#Complete

if has("autocmd")
  autocmd BufNewFile,BufRead *.py set ai
  autocmd BufNewFile,BufRead *.py syntax on
  autocmd BufNewFile,BufRead *.py set expandtab softtabstop=4 filetype=python
  autocmd BufRead *.py set smartindent cinwords=if,elif,for,while,try,except,finally,def,class
  autocmd BufNewFile,BufRead *.c,*.h,*.C,*.H,*.cpp,*.hpp,*.cxx,*.hxx set cindent cinoptions=g1s
  autocmd BufNewFile,BufRead *.c,*.h,*.C,*.H,*.cpp,*.hpp,*.cxx,*.hxx set expandtab
  autocmd BufNewFile,BufRead *.tpp set ft=cpp
  autocmd BufNewFile,BufRead *.abnf set ft=abnf
  "autocmd BufNewFile,BufRead *.py set nospell
  autocmd BufNewFile,BufRead *.inc set filetype=php
  autocmd BufNewFile,BufRead *.R set expandtab softtabstop=2 filetype=r
  autocmd BufNewFile,BufRead *.js set expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.html set expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.csv set filetype=txt
  autocmd BufNewFile,BufRead *.tl set filetype=lisp

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" mappings
map <C-F4> gg=G
map <C-F5> gggqG

" tags stuff
nmap ,t :!(cd %:p:h;ctags -R *)

nmap ,m :'<,'>ScreenSend<CR>

" make tabs obvious
set lcs=tab:>-,trail:-

" screen
"let g:ScreenShellTerminal=''
let g:ScreenImpl='Tmux'


" for javascript
autocmd FileType javascript noremap <buffer>  <C-o> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <C-o> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <C-o> :call CSSBeautify()<cr>

set noignorecase
set number
set ruler
set relativenumber

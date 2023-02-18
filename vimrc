set nocompatible              " be iMproved, required

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'ervandew/screen'
Plug 'vim-syntastic/syntastic'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-scripts/upAndDown'
Plug 'pangloss/vim-javascript'

" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" colors
Plug 'jpo/vim-railscasts-theme'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'

Plug 'nvim-lua/plenary.nvim'
Plug 'scalameta/nvim-metals'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plug 'ascenator/L9', {'name': 'newL9'}

" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" see :h  for more details or wiki for FAQ
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
  autocmd BufNewFile,BufRead *.sh set expandtab softtabstop=2
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
nmap ,c :!(cd %:p:h;ctags -R *)

nmap ,m :'<,'>ScreenSend<CR>

" make tabs obvious
set lcs=tab:>-,trail:-

" screen
"let g:ScreenShellTerminal=''
let g:ScreenImpl='Tmux'

" command T
let g:CommandTPreferredImplementation='lua'

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

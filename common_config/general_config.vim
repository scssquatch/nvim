" required for several plugins
set nocompatible

" enable syntax highlighting
syntax on

" default color scheme
set t_Co=256

" don't wrap long lines
set nowrap

" show commands as we type them
set showcmd

" highlight matching brackets
set showmatch

" scroll the window when we get near the edge
set scrolloff=4 sidescrolloff=10

" use 2 spaces for tabs
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set smarttab

" enable line numbers, and don't make them any wider than necessary
set number numberwidth=2

" show the first match as search strings are typed
set incsearch

" highlight the search matches
set hlsearch

" searching is case insensitive when all lowercase
set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
set gdefault

" set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

" pick up external file modifications
set autoread

" don't abandon buffers when unloading
set hidden

" match indentation of previous line
set autoindent

" perform autoindenting based on filetype plugin
filetype plugin indent on

" don't blink the cursor
set guicursor=a:blinkon0

" show current line info (current/total)
set ruler rulerformat=%=%l/%L

" show status line
set laststatus=2

" When lines are cropped at the screen bottom, show as much as possible
set display=lastline

" flip the default split directions to sane ones
set splitright
set splitbelow

" don't beep for errors
set visualbell

" make backspace work in insert mode
set backspace=indent,eol,start

" highlight trailing whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

" have the mouse enabled all the time
set mouse=a

" use tab-complete to see a list of possiblities when entering commands
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/target/**

" allow lots of tabs
set tabpagemax=20

" make and python use real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set spell

" Remove strange characters that trigger auto indent for haml
au BufNewFile,BufRead *.haml set indentkeys=o,O,*<Return>,=else,=elsif,=rescue,=ensure,=when

" nghaml is haml
au BufNewFile,BufRead *.nghaml set filetype=haml

" es6 is js
au BufNewFile,BufRead *.js.es6 set filetype=javascript

" Set encoding
set encoding=utf-8

" Use modeline overrides
set modeline
set modelines=10

" strip trailing whitespaces on save
autocmd FileType ruby,python,javascript,java autocmd BufWritePre <buffer> :%s/\s\+$//e

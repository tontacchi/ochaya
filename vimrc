" Disable compatilibity with vi (which can cause unexpected issues)
set nocompatible

" Enable type file detection (vim will be able to try to detect the type of file in use)
filetype on

" Enable plugins and load plugin for the detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Syntax Highlighting
syntax on

" Hybrid Line Numbers
set number
set relativenumber

" incrementally highlight matching characters during search
set incsearch

" Ignore capital letters during search
set ignorecase

" Override ignorecase when specifically searching capital letters
set smartcase

" Show editor mode on last line
set showmode

" Backspace will remove blank lines
set backspace=indent,eol,start

" Shows Row and Col number in the status bar
set ruler

" tab width is 4 in insert & normal mode
set tabstop=4
set shiftwidth=4

" cursor cannot get withint 10 lines of the screen edge while scrolling
set scrolloff=10

" lines extend until \n
set nowrap

" enable auto-complete menu after tab
set wildmenu

" wildmenu behaves similar to bash completion
set wildmode=list:longest

" ignore files vim should not be editing
set wildignore=*.docx,*.jpg,*.jpeg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*img,*.xlsx

set fillchars=fold:\
hi Folded ctermfg=102 guifg=#878787 guibg=NONE ctermbg=NONE

set whichwrap+=>,l
set whichwrap+=<,h

" blinking underline for insert mode, block for everything else
let &t_SI = "\e[3 q"
let &t_EI = "\e[2 q"

" Line Folding
set foldmethod=marker

" Configure folding for C files to start below opening braces
autocmd FileType c setlocal foldmethod=syntax
autocmd FileType c setlocal foldenable
autocmd FileType c setlocal foldlevel=0

autocmd FileType lua setlocal foldmethod=indent
autocmd FileType lua setlocal foldenable
autocmd FileType lua setlocal foldlevel=1

autocmd FileType lua setlocal shiftwidth=2 tabstop=2

autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal foldenable
autocmd FileType python setlocal foldlevel=1

" Fast Fold Toggle
nnoremap <space> za

" MAPPINGS -----------------------------------------------------------------{{{

" Alt + j moves lines down, Alt + k moves lines up for all modes
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ctrl + c yanks to system clipboard
vnoremap <C-c> "*y

" ctrl + v pastes from system clipboard
inoremap <C-v> <C-r><C-p>*

inoremap jk <Esc>l

"}}}---------------------------------------------------------------------------

" VIMSCRIPT ----------------------------------------------------------------{{{

" }}}--------------------------------------------------------------------------


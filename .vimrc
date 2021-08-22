execute pathogen#infect()

"basic stuff
set nocompatible "don't try to be vi compatible, use vim improvements

"visualization
set number
syntax enable "syntax highlighting
set hlsearch "highlight search
set showmatch "matching parens

"indentation
set expandtab "tabs are spaces
set tabstop=4 "intenting with tab key
set shiftwidth=4 "indenting with '>' in visual mode etc
set autoindent "copy indentation from prev line when making a new one
filetype plugin indent on "indent rules from /usr/share/vim/vim80/indent

"colorscheme stuff
set background=dark
colorscheme solarized

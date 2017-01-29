set nocompatible    " use vim defaults
set ls=2            " allways show status line
set expandtab       " tabs are converted to spaces, use only when required
set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set softtabstop=2   " backspace key treat the two spaces like a tab
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
"set incsearch      " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb= " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
"set noignorecase    " don't ignore case
set ignorecase      " ignore case when searching 
set smartcase       " ignorecase + smartcase ignore case unless upper case used when searching 
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0    " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
"set nostartofline  " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

"set autoindent     " always set autoindenting on
"set smartindent    " smart indent
"set cindent        " cindent
set noautoindent
set nosmartindent
set nocindent

"set autowrite      " auto saves changes when quitting and swiching buffer
"set sm             " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines
"
set clipboard=unnamed

syntax on           " syntax highlighing

hi LineNr term=bold ctermfg=DarkGrey " line number color

"NERDTree legacy arrow
let g:NERDTreeDirArrows=0

call pathogen#infect()
filetype plugin indent on      " enable file type based indentation

" Zen Coding
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

let g:syntastic_ruby_checkers=['rubocop', 'mri']

" tagbar
nmap <F8> :TagbarToggle<CR>

" Keymaps
map <C-n> :NERDTreeToggle<CR>
map <C-l> :set nonumber!<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

autocmd BufWritePre * :retab

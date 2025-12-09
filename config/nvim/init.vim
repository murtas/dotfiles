" ================================
" Basic UI and editing behavior
" ================================
set nocompatible
set ls=2
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=3
set showcmd
set hlsearch
set ruler
set visualbell t_vb=
set novisualbell
set nobackup
set number
set ignorecase
set smartcase
set title
set ttyfast
set modeline
set modelines=3
set shortmess=atI
set whichwrap=b,s,h,l,<,>,[,]
set noautoindent
set nosmartindent
set nocindent
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamedplus

syntax on

hi LineNr term=bold ctermfg=DarkGrey

filetype plugin indent on


" Function to load NERDTree only if needed, then toggle it.
function! ToggleNERDTree()
    " Check if the NERDTreeToggle command is defined.
    " If it is not defined, we need to load the package.
    if !exists(':NERDTreeToggle')
        " Loads the package from the 'opt' directory.
        packadd nerdtree
    endif

    " Now the command is guaranteed to exist, so we run it.
    NERDTreeToggle
endfunction
" Calls the function defined above.
" <silent> prevents the command from echoing in the status bar.
nnoremap <silent> <C-n> :call ToggleNERDTree()<CR>

let g:NERDTreeDirArrows=0

" ================================
" Keymaps
" ================================
nnoremap <C-l> :set nonumber!<CR>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" ================================
" Autocommands
" ================================
autocmd BufWritePre * :retab
autocmd FileType gitcommit,markdown setlocal spell spelllang=en_us


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

" ================================
" FZF Integration
" ================================
" Cross-platform fzf setup
if executable('fzf')
    " Common installation paths
    let s:fzf_paths = [
        \ $HOME . '/.fzf',
        \ '/usr/local/opt/fzf',
        \ '/opt/homebrew/opt/fzf',
        \ '/usr/share/vim/vimfiles',
        \ '/usr/share/fzf',
        \ '/usr/share/doc/fzf/examples',
    \ ]

    " Also check if fzf was installed via package manager
    if executable('brew')
        let s:brew_path = trim(system('brew --prefix fzf 2>/dev/null'))
        if v:shell_error == 0 && isdirectory(s:brew_path)
            call add(s:fzf_paths, s:brew_path)
        endif
    endif

    " Find and add the first valid fzf path
    for path in s:fzf_paths
        if isdirectory(path) && (filereadable(path . '/plugin/fzf.vim') || isdirectory(path . '/plugin'))
            execute 'set rtp+=' . path
            break
        endif
    endfor
endif


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

" FZF keybindings
nnoremap <C-p> :FZF<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>h :History<CR>

" ================================
" Autocommands
" ================================
autocmd BufWritePre * :retab
autocmd FileType gitcommit,markdown setlocal spell spelllang=en_us


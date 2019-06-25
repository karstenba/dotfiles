" Set compatibility to Vim only.
set nocompatible

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Speed up scrolling in Vim
set ttyfast

set splitbelow
set splitright

" Allow project specific .vimrc files
set exrc
set secure

" Show line numbers
set number
set relativenumber

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Turn off errorbell and visualbell
set noeb vb t_vb=

" Source FZF installed via pacman
if filereadable(expand("/usr/share/vim/vimfiles/plugin/fzf.vim"))
  source /usr/share/vim/vimfiles/plugin/fzf.vim
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
" In addition to FZF above VIM specifics
" see https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'hdima/python-syntax'
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
Plug 'Valloric/YouCompleteMe'

Plug 'w0rp/ale'
Plug 'python/black'
Plug 'itchyny/lightline.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" Turn on after plugins initialized
filetype plugin on

" Don't show docs while autocompleting
set completeopt-=preview

" autocmd FileType [filetype] setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab textwidth=0 (defaults to 0)
au FileType python setl sw=4 ts=4 sts=0 et
au FileType javascript setl sw=2 ts=2 sts=0 et
au FileType dockerfile setl sw=2 ts=2 sts=0 et
au FileType yaml setl sw=2 ts=2 sts=0 et
au FileType terraform setl sw=2 ts=2 sts=0 et
" fallback
set sw=2
set ts=2
set sts=0
set et

syntax on

" Lightline config
" Don't show mode on bottom as lightline already shows it
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'PaperColor',
	\ 'component_function': {
	\	'filename': 'LightlineFilename'
	\ }
	\ }

function! LightlineFilename()
	return expand('%')
endfunction

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <C-P> :GFiles<CR>

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O> :set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set background=light
colorscheme PaperColor

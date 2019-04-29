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

" Display options
"set showmode
"set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
"set matchpairs+=<:>

" Display different types of white spaces.
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number
set relativenumber

" Set status line display
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

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

" Map the <Space> key to toggle a selected fold opened/closed.
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

" Automatically save and load folds
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview"

 " Call the .vimrc.plug file
" if filereadable(expand("~/.vimrc.plug"))
"     source ~/.vimrc.plug
" endif

" Turn off errorbell and visualbell
set noeb vb t_vb=

" Source FZF installed via pacman
if filereadable(expand("/usr/share/vim/vimfiles/plugin/fzf.vim"))
  source /usr/share/vim/vimfiles/plugin/fzf.vim
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'hdima/python-syntax'
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}

Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" Turn on after plugins initialized
filetype on

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

" Status bar
"set laststatus=2

"Ctrl-P to invoke GFile
nnoremap <C-P> :GFile<CR>

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set background=light
colorscheme PaperColor

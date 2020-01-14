" turn off vi compatibility and set unicode encoding
set nocp enc=utf-8

call plug#begin(stdpath('data') . '/plugged')

" Visual Plugins

Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1

Plug 'vim-airline/vim-airline'
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Navigation Plugins

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <leader>f :FZF -m<cr>

" Editing Plugins

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'go': ['golangci-lint']
\}
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'css': ['prettier'],
\ 'html': ['prettier'],
\ 'go': ['goimports']
\}
let g:ale_fix_on_save = 1

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

" Git Plugins

Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language Plugins

Plug 'mattn/emmet-vim'
Plug 'keith/swift.vim'
Plug 'fatih/vim-go'
Plug 'mxw/vim-jsx'

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

call plug#end()

" Syntax highlighting
set termguicolors
colorscheme gruvbox

" show line numbers and cursor position
set nu ru

" indent is 2 spaces
set et sr ts=2 sw=2 sts=2

" wrap at column 80 automatically, show 80 column ruler
set tw=80 fo=cqrn wm=0 cc=81

" fix backspace behavior
set bs=indent,eol,start

" keep 3 lines of context around cursor
set so=3

" keep hidden buffers around (not sure exactly what this does?)
set hidden

" tell vim we have a fast terminal
set tf

" always show status line with command
set ls=2 sc

" highlight while searching, incremental search, ignore case unless capitalized
set hls is ic scs

" show trailing whitespace
set list lcs=trail:.

" use the system clipboard
set clipboard=unnamedplus

" disable the bell
set bo=all

" set mapleader to space
nnoremap <Space> <Nop>
let mapleader = " "

" autocmds
if has('autocmd')
  au BufWritePost init.vim source $MYVIMRC

  au BufNewFile,BufRead *.py
    \ setlocal ts=4 sts=4 sw=4

  au BufNewFile,BufRead *.swift
    \ setlocal ts=4 sts=4 sw=4

  au BufNewFile,BufRead *.go
    \ setlocal ts=4 sts=4 sw=4 noet

  au BufNewFile,BufRead *.make
    \ setlocal ts=4 sts=4 sw=4 noet

  au BufNewFile,BufRead Makefile
    \ setlocal ts=4 sts=4 sw=4 noet
endif

" keybindings
nnoremap <silent> <leader>q :bp\|bd #<cr>

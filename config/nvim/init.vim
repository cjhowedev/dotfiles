" Plugins {{{

" turn off vi compatibility and set unicode encoding - required for plug
set nocp enc=utf-8

call plug#begin(stdpath('data') . '/plugged')

" Visual Plugins {{{

Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'

" }}}

" Navigation Plugins {{{

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <leader>f :FZF -m<cr>

" }}}

" Editing Plugins {{{

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

" }}}

" Git Plugins {{{

Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" }}}

" Language Plugins {{{

let g:coc_global_extensions = [
  \'coc-json',
  \'coc-java',
  \'coc-tsserver',
  \'coc-prettier',
  \'coc-eslint'
\]
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Backend Development
Plug 'keith/swift.vim'

" Web Development
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

" }}}

call plug#end()

" }}}

" Options {{{

" Syntax highlighting
set termguicolors
silent! colorscheme gruvbox

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
set list lcs=trail:.,tab:>\ ,eol:$

" disable the bell
set bo=all

" use syntax folding by default
set foldmethod=syntax

" use system clipboard
set clipboard=unnamedplus

" }}}

" Autocmds {{{

if has('autocmd')
  au BufWritePost *
    \ execute ':Git add %'

  au BufWritePost init.vim
    \ source $MYVIMRC |
    \ setlocal foldmethod=marker

  au BufNewFile,BufRead *.vim
    \ setlocal foldmethod=marker

  au BufNewFile,BufRead *.py
    \ setlocal ts=4 sts=4 sw=4

  au BufNewFile,BufRead *.swift
    \ setlocal ts=4 sts=4 sw=4

  au BufNewFile,BufRead *.java
    \ setlocal cc=

  au BufNewFile,BufRead *.make
    \ setlocal ts=4 sts=4 sw=4 noet

  au BufNewFile,BufRead Makefile
    \ setlocal ts=4 sts=4 sw=4 noet
endif

" }}}

" Keybindings {{{

" set mapleader to space
nnoremap <Space> <Nop>
let mapleader = " "

nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>q :bp\|bd #<cr>

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" }}}

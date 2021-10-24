vim.cmd([[
" Plugins {{{

call plug#begin(stdpath('data') . '/plugged')

" Visual Plugins {{{

Plug 'morhetz/gruvbox'

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
  \'coc-eslint',
  \'coc-clangd',
  \'coc-rls'
\]
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" App Development
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
]])


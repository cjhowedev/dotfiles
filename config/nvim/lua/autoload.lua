vim.cmd([[
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
]])

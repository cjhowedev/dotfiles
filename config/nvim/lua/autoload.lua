vim.cmd([[
augroup fmt
    autocmd!
    autocmd BufWritePre * Neoformat
augroup END

au BufNewFile,BufRead *.py
    \ setlocal ts=4 sts=4 sw=4

au BufNewFile,BufRead *.java
    \ setlocal cc=

au BufNewFile,BufRead *.rust
    \ setlocal ts=4 sts=4 sw=4 cc=101

au BufNewFile,BufRead *.make
    \ setlocal ts=4 sts=4 sw=4 noet

au BufNewFile,BufRead Makefile
    \ setlocal ts=4 sts=4 sw=4 noet

au BufNewFile,BufRead *.go
    \ setlocal ts=4 sts=4 sw=4 noet

au BufNewFile,BufRead *.lua
    \ setlocal ts=4 sts=4 sw=4 foldmethod=marker
]])

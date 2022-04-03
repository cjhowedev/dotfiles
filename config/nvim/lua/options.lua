-- Make vim sane
vim.opt.cp = false
vim.opt.enc = 'utf-8'

-- Syntax highlighting
vim.opt.termguicolors = true
vim.cmd([[
silent! colorscheme gruvbox
]])

-- show line numbers and cursor position
vim.opt.nu = true
vim.opt.ru = true

-- indent is 2 spaces
vim.opt.et = true
vim.opt.sr = true
vim.opt.ts = 2
vim.opt.sw = 2
vim.opt.sts = 2

-- wrap at column 80 automatically, show 80 column ruler
vim.opt.tw = 80
vim.opt.fo = 'cqrn'
vim.opt.wm = 0
vim.opt.cc = '81'

-- fix backspace behavior
vim.opt.bs = 'indent,eol,start'

-- keep 3 lines of context around cursor
vim.opt.so = 3

-- keep hidden buffers around (not sure exactly what this does?)
vim.opt.hidden = true

-- tell vim we have a fast terminal
vim.opt.tf = true

-- always show status line with command
vim.opt.ls = 2
vim.opt.sc = true

-- highlight while searching, incremental search, ignore case unless copttalized
vim.opt.hls = true
vim.opt.is = true
vim.opt.ic = true
vim.opt.scs = true

-- show trailing whitespace
vim.opt.list = true
vim.opt.lcs = 'trail:.,tab:> ,eol:$'

-- disable the bell
vim.opt.bo = 'all'

-- use syntax folding by default
vim.opt.foldmethod = 'syntax'

-- use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- for nvim-cmp completion
vim.opt.completeopt = 'menu,menuone,noselect'

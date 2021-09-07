vim.o.cp = false
vim.o.enc = 'utf-8'

vim.o.nu = true
vim.o.ru = true

vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.o.shiftround = true

vim.bo.textwidth = 80
vim.bo.formatoptions = 'cqrn'
vim.bo.wrapmargin = 0
vim.wo.colorcolumn = '81'

vim.o.backspace = 'indent,eol,start'

vim.o.scrolloff = 3

vim.o.hidden = true

vim.o.laststatus = 2
vim.o.showcmd = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.list = true
vim.wo.listchars = 'trail:.,tab:> ,eol:$'

vim.o.belloff = 'all'

vim.wo.foldmethod = 'syntax'

vim.o.clipboard = 'unnamedplus'

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

if fn.has('nvim') then
    execute 'au BufNewFile,BufRead *.make setlocal ts=4 sts=4 sw=4 noet'
    execute 'au BufNewFile,BufRead Makefile setlocal ts=4 sts=4 sw=4 noet'
end

require('packer').startup(function()
    use {'wbthomason/packer.nvim'}

    use {'nvim-lua/plenary.nvim'}

    use {'nvim-treesitter/nvim-treesitter'}
    use {
        'nvim-treesitter/playground',
        after = 'nvim-treesitter/nvim-treesitter'
    }

    use {'neovim/nvim-lspconfig', config = function()
      require'lspconfig'.clangd.setup{}
      require'lspconfig'.cmake.setup{}
    end}
    use {'nvim-lua/completion-nvim'}

    use {'tpope/vim-commentary'}

    use {'junegunn/fzf.vim'}
    use {'phaazon/hop.nvim'}

    use {'tpope/vim-fugitive'}
end)

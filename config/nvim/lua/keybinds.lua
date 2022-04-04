vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', {})
vim.api.nvim_set_keymap('n', '<leader>j', '<cmd>Telescope find_files<cr>',
                        {silent = true})
vim.api
    .nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>f', ':Neoformat<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>n', ':bn<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>p', ':bp<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>w', ':bd<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>h', '<Cmd>lua vim.lsp.buf.hover()<cr>',
                        {silent = true})

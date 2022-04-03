local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig')['sumneko_lua'].setup({
    settings = {
        Lua = {
            completion = {callSnippet = 'Both'},
            diagnostics = {globals = {'vim'}},
            telemetry = {enable = false}
        }
    },
    capabilities = capabilities
})
require'lspconfig'.clangd.setup {capabilities = capabilities}
require'lspconfig'.cmake.setup {capabilities = capabilities}
require'lspconfig'.eslint.setup {capabilities = capabilities}
require'lspconfig'.rust_analyzer.setup {capabilities = capabilities}
require'lspconfig'.tsserver.setup {capabilities = capabilities}


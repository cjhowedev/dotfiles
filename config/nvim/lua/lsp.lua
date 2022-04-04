local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = require'lsp-format'.on_attach

local luadev = require'lua-dev'.setup {}
local function merge(first_table, second_table)
    for k, v in pairs(second_table) do first_table[k] = v end
    return first_table
end

require'lspconfig'.sumneko_lua.setup(merge({
    settings = {
        Lua = {
            completion = {callSnippet = 'Both'},
            diagnostics = {globals = {'vim'}},
            telemetry = {enable = false}
        }
    },
    capabilities = capabilities,
    on_attach = on_attach
}, luadev))
require'lspconfig'.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require'lspconfig'.cmake.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require'lspconfig'.eslint.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require'lspconfig'.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}


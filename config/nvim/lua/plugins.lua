local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Visual plugins

    use 'morhetz/gruvbox'
    use 'stevearc/dressing.nvim'
    use {
        'nathanaelkane/vim-indent-guides',
        config = function()
            vim.g['indent_guides_enable_on_vim_startup'] = 1
        end
    }
    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require'lualine'.setup {options = {theme = 'gruvbox'}}
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require'gitsigns'.setup {} end
    }

    -- Navigation plugins

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function()
            require'telescope'.setup {
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {}
                    }
                }
            }
            require'telescope'.load_extension('ui-select')
        end
    }
    use {'nvim-telescope/telescope-ui-select.nvim'}

    -- Editing plugins

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-git'
    use 'tpope/vim-fugitive'
    use {
        'editorconfig/editorconfig-vim',
        config = function()
            vim.g['EditorConfig_exclude_patterns'] = {
                'fugitive://.*', 'scp://.*'
            }
        end
    }

    -- Project Support

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            vim.g.nvim_tree_respect_buf_cwd = 1
            require'nvim-tree'.setup {
                update_cwd = true,
                update_focused_file = {enable = true, update_cwd = true}
            }
        end
    }
    use {
        'ahmedkhalf/project.nvim',
        config = function() require'project_nvim'.setup {} end
    }

    -- Formatting

    use {
        'lukas-reineke/lsp-format.nvim',
        config = function() require'lsp-format'.setup {} end
    }
    use {
        'sbdchd/neoformat',
        config = function()
            vim.g.neoformat_enabled_lua = {'luaformat'}
            vim.g.neoformat_enabled_cpp = {'clangformat'}
            vim.g.neoformat_enabled_c = {'clangformat'}
            vim.g.neoformat_enabled_objc = {'clangformat'}
            vim.g.neoformat_enabled_typescript = {'prettier'}
            vim.g.neoformat_enabled_typescriptreact = {'prettier'}
            vim.g.neoformat_enabled_javascript = {'prettier'}
            vim.g.neoformat_enabled_javascriptreact = {'prettier'}
            vim.g.neoformat_enabled_html = {'prettier'}
            vim.g.neoformat_enabled_css = {'prettier'}
            vim.g.neoformat_enabled_less = {'prettier'}
            vim.g.neoformat_enabled_sass = {'prettier'}
            vim.g.neoformat_enabled_scss = {'prettier'}
            vim.g.neoformat_enabled_markdown = {'prettier'}
            vim.g.neoformat_enabled_go = {'goimports'}
            vim.g.neoformat_basic_format_trim = 1
            vim.g.neoformat_basic_format_retab = 1
        end
    }

    -- Autocomplete

    use({'L3MON4D3/LuaSnip'})
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lsp-signature-help'}
        },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        select = true,
                        behavior = cmp.ConfirmBehavior.Replace
                    })
                },
                sources = cmp.config.sources({
                    {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'path'},
                    {name = 'nvim_lsp_signature_help'}
                }, {{name = 'buffer'}})
            })
        end
    }
    use 'neovim/nvim-lspconfig'

    -- Lua

    use "folke/lua-dev.nvim"

    -- JS

    use 'mattn/emmet-vim'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use {'styled-components/vim-styled-components', branch = 'main'}
    use 'mxw/vim-jsx'
    use {
        'pangloss/vim-javascript',
        config = function() vim.g['javascript_plugin_jsdoc'] = 1 end
    }

    -- C++

    use 'bfrg/vim-cpp-modern'

    -- Rust

    use 'rust-lang/rust.vim'

    -- Dart
    use 'dart-lang/dart-vim-plugin'
    use {
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require'flutter-tools'.setup {} end
    }

    if packer_bootstrap then require('packer').sync() end
end)


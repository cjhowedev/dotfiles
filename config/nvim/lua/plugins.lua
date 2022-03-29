local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Visual plugins

  use 'morhetz/gruvbox'
  use {
    'nathanaelkane/vim-indent-guides',
    config = function()
      vim.g['indent_guides_enable_on_vim_startup'] = 1
    end
  }

  -- Navigation plugins

  use {
    'junegunn/fzf',
    run = 'cd ~/.fzf && ./install --all'
  }
  use 'junegunn/fzf.vim'

  -- Editing plugins

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-git'
  use 'tpope/vim-fugitive'

  -- Language plugins
  use {
    'editorconfig/editorconfig-vim',
    config = function()
      vim.g['EditorConfig_exclude_patterns'] = {'fugitive://.*', 'scp://.*'}
    end
  }

  use {
    'neovim/nvim-lspconfig',
    after = {'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp'},
    config = function()
      local capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      require('lspconfig')['sumneko_lua'].setup{
        capabilities = capabilities
      }
      require'lspconfig'.clangd.setup {
        capabilities = capabilities
      }
      require'lspconfig'.cmake.setup{
        capabilities = capabilities
      }
      require'lspconfig'.eslint.setup {
        capabilities = capabilities
      }
      require'lspconfig'.rust_analyzer.setup{
        capabilities = capabilities
      }
      require'lspconfig'.sourcekit.setup{
        capabilities = capabilities
      }
      require'lspconfig'.tsserver.setup {
        capabilities = capabilities
      }
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-n>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
          })
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  }

  use 'keith/swift.vim'

  use 'mattn/emmet-vim'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use {
    'styled-components/vim-styled-components',
    branch = 'main'
  }
  use 'mxw/vim-jsx'
  use {
    'pangloss/vim-javascript',
    config = function()
      vim.g['javascript_plugin_jsdoc'] = 1
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)


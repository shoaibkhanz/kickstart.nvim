return {
  -- nvim-ufo plugin configuration
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'BufReadPost',
    config = function()
      -- Folding options
      vim.o.foldcolumn = '1' -- '0' is also acceptable
      vim.o.foldlevel = 99 -- Using ufo provider requires a large value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Key mappings for folding
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      -- Initialize nvim-ufo with provider_selector
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          if filetype == 'neo-tree' then
            return '' -- Disable nvim-ufo for neo-tree
          else
            return { 'lsp', 'indent' }
          end
        end,
      }

      -- Option 2: nvim-lspconfig as LSP client
      -- Add foldingRange to capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- Use the capabilities in all LSP servers
      local lspconfig = require 'lspconfig'
      local servers = lspconfig.util.available_servers()

      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          capabilities = capabilities,
          -- You can add other server-specific settings here
        }
      end

      -- Disable folding in neo-tree buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'neo-tree',
        callback = function()
          vim.opt_local.foldenable = false
          vim.opt_local.foldmethod = 'manual'
        end,
      })
    end,
  },

  -- nvim-lspconfig plugin (ensure it's included)
  {
    'neovim/nvim-lspconfig',
    -- You can add your LSP configurations here if needed
  },

  -- Other plugins...
}

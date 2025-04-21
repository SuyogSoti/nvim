return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { 'saghen/blink.cmp', "neovim/nvim-lspconfig", "williamboman/mason.nvim"},
    lazy = false,
    keys = {
        { "K", vim.lsp.buf.hover, desc = "Function Help" },
        {'gh', vim.lsp.buf.hover, desc = "Function Help"},
        {'gr', vim.lsp.buf.rename, desc = "Rename"},
        {'ga', vim.lsp.buf.code_action, desc = "Code Action"},
        {'ge', vim.diagnostic.open_float, desc = "Show Error"},
        {'[d', vim.diagnostic.goto_prev, desc = "Prev Error"},
        {']d', vim.diagnostic.goto_next, desc = "Next Error"},
    },
    opts = function(_, opts)
      require("mason").setup({})
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
              virtual_text = false
          }
      )

      vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              client.server_capabilities.semanticTokensProvider = nil
          end,
      })

      if inCitc() then
          -- don't set suff up for google here
          return
      end
      local ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "clangd",
          "cssls",
          "gopls",
          "html",
          "intelephense",
          "pyright",
          "solargraph",
          "sqlls",
          "jdtls",
          "jsonnet_ls",
      }

      local lspconfig = require('lspconfig')
      for id, server in ipairs(ensure_installed) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        -- local capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup({})
      end
      return {
          ensure_installed = ensure_installed
      }
   end
}

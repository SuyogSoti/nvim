return {
    "scalameta/nvim-metals",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function ()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
      end
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
}

require("helper_funcs")

return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    picker = {
      dirs = getSearchableFiles(),
    },
    notifier = {},
    gitbrowse = {
      -- your gitbrowse configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    explorer = {},
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader>p", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>bb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>bs", function() Snacks.picker.lines() end, desc = "Search Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    --
    -- find
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },

    -- Commands
    { "<leader><space>", function() Snacks.picker() end, desc = "All Pickers" },
    { "<leader>o", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>G", function() Snacks.gitbrowse() end, desc = "Commands" },

    -- LSP
    { "gl", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gR", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "gS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    -- neovim
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
  },
}

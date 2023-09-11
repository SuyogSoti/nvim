-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end


return require('packer').startup(function()
  use { 'lewis6991/impatient.nvim', config = function()
    require("impatient")
  end }
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- fixes a cursor hold autocmd bug in neovim - https://github.com/neovim/neovim/issues/12587
  use "antoinemadec/FixCursorHold.nvim"

  -- Theme and looks
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end,
  }
  use 'RRethy/nvim-base16'

  use { 'andymass/vim-matchup', event = 'VimEnter' }
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
  use 'tpope/vim-commentary'
  -- Note: vim sound make it not change cursor when d is pressed
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'skywind3000/asyncrun.vim'
  use 'sbdchd/neoformat'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-eunuch'
  use 'editorconfig/editorconfig-vim'

  -- searching?
  use 'easymotion/vim-easymotion'
  use 'wincent/ferret'


  -- Git Stuff
  use 'tpope/vim-fugitive'
  use 'rhysd/conflict-marker.vim'
  use 'mhinz/vim-signify'

  -- html
  use 'mattn/emmet-vim'

  -- tex
  use { 'lervag/vimtex', ft = { 'tex' } }

  -- navigation
  use 'kyazdani42/nvim-web-devicons' 
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, config = function()
    require 'nvim-tree'.setup {
      view = {
        width = 50,
      },
    }
  end }
  use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf' } }

  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim' },
    config = function()
      require('telescope').setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown()
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          }
        },
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close
            },
          },
        }
      }
      require("telescope").load_extension("ui-select")
      require('telescope').load_extension('fzf')
    end
  }

  -- Tmux stuff
  use 'benmills/vimux'

  -- Terminal stuff
  use 'kassio/neoterm'

  -- Trouble.nvim
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {'html', 'yaml'},
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end }

  -- Neovim 0.5 stuff
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'neovim/nvim-lspconfig'

  -- lsp
  use {
    "williamboman/mason.nvim",
    requires = {"neovim/nvim-lspconfig"},
  }
  use { "williamboman/mason-lspconfig.nvim", requires = {'williamboman/mason.nvim'}, config=function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "cssls",
        "gopls",
        "html",
        "tsserver",
        "intelephense",
        "pyright",
        "solargraph",
        "sqlls",
        "jdtls",
      },
    }
  end}
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "lsp_signature".setup({
        hint_enable = false, -- repetitive hints
      })
    end
  }
  use { 'gfanto/fzf-lsp.nvim', branch = 'main' }
  use { 'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path' }

  -- copy paste that works throught ssh - only without tmux
  use { 'ojroques/vim-oscyank', branch = 'main' }

  use {
    "luckasRanarison/nvim-devdocs",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-devdocs").setup({
        mappings = { -- keymaps for the doc buffer
          open_in_browser = "C-~"
        },
        previewer_cmd = "glow", -- for example: "glow" or nil
        picker_cmd = true,
        cmd_args = {"-s", "dark", "-w", "80" },
        picker_cmd_args = { "-p"},
        ensure_installed = {
          'go',
          'rust',
          'javascript',
          'typescript',
          'http',
          'css',
          'tailwindcss',
          'c',
          'cpp',
          'dom',
          'react',
          'bash',
          'cmake~3.26',
          'dart~2',
          'deno',
          'docker',
          'git',
          'jquery',
          'python~3.11',
          'kubernetes',
          'markdown',
          'pandas~1',
          'php',
          -- 'openjdk~19',
          'postgresql~15',
          'sqlite'
        }, -- get automatically installed
      })
  -- this is for remote work
  use {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
      require('distant'):setup()
    end
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

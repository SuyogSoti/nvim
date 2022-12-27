-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function()
  use {'lewis6991/impatient.nvim', config=function ()
    require("impatient")
  end}
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- fixes a cursor hold autocmd bug in neovim - https://github.com/neovim/neovim/issues/12587
  use "antoinemadec/FixCursorHold.nvim"

  -- Theme and looks
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config=function()
      require('lualine').setup()
    end,
  }
  use 'RRethy/nvim-base16'

  use {'andymass/vim-matchup', event = 'VimEnter'}
  use {'windwp/nvim-autopairs', config=function() require('nvim-autopairs').setup() end}
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
  use {'lervag/vimtex', ft={'tex'}}

  -- navigation
  use { 'kyazdani42/nvim-tree.lua', requires={'kyazdani42/nvim-web-devicons', opt=true}, config=function()
    require'nvim-tree'.setup {
      view = {
        width = 50,
      },
    }
  end}
  use {'junegunn/fzf.vim', requires={'junegunn/fzf'}}

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {
    'nvim-telescope/telescope.nvim',
    requires =  {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim'},
    config = function ()
      require('telescope').setup{
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
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
      require('telescope').load_extension('fzf')
    end
  }

  -- Tmux stuff
  use 'benmills/vimux'

  -- Terminal stuff
  use 'kassio/neoterm'


  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config=function() 
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "all", -- one of "all", "maintained" (
      ignore_install = {}, -- List of parsers to ignore installing
      highlight = {
        enable = true,              -- false will disable the whole extension
        disable = {},  -- list of language that will be disabled
      },
    }
  end}

  -- Neovim 0.5 stuff
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- lsp
  use {
    'williamboman/nvim-lsp-installer',
    requires={'neovim/nvim-lspconfig'},
    run=function()
      local lsp_installer = require("nvim-lsp-installer")
      lsp_installer.install("clangd")
      lsp_installer.install("cssls")
      lsp_installer.install("eslint")
      lsp_installer.install("eslint")
      lsp_installer.install("gopls")
      lsp_installer.install("html")
      lsp_installer.install("tsserver")
      lsp_installer.install("intelephense")
      lsp_installer.install("pyright")
      lsp_installer.install("solargraph")
      lsp_installer.install("sqls")
      lsp_installer.install("rust_analyzer")
      lsp_installer.install("jdtls")
    end,
  }
  use {
    "ray-x/lsp_signature.nvim",
    config=function ()
      require "lsp_signature".setup({
        hint_enable = false, -- repetitive hints
      })
    end
  }
  use {'gfanto/fzf-lsp.nvim', branch='main'}
  use {'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path'}

  -- copy paste that works throught ssh
  use {'ojroques/vim-oscyank', branch='main'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)


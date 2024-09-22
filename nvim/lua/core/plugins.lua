local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')

lazy.setup({

    -- Color scheme --
  "ellisonleao/gruvbox.nvim",              -- Gruvbox
  "folke/tokyonight.nvim",                 -- Tokyonight
  "shaunsingh/nord.nvim",                  -- Nord
  "catppuccin/nvim",                       -- Catppuccin
  "Mofiqul/dracula.nvim",                  -- Dracula
  "sainnhe/everforest",                    -- Everforest
  "navarasu/onedark.nvim",                 -- Onedark
  "glepnir/zephyr-nvim",                   -- zephyr

  -- Treesitter --
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},

  -- Telescope --
  {'nvim-telescope/telescope.nvim',
  dependencies = {'nvim-lua/plenary.nvim'}},

  -- Lualine --
  {'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons'}},

  -- Bufferline --
  {'akinsho/bufferline.nvim', version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Dashboard --
  {'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Comment --
  'numToStr/Comment.nvim',

  -- File Explorer --
  {"nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x", dependencies = {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  "3rd/image.nvim"}},

  -- Indentline --
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},

  -- Autopairs --
  {'windwp/nvim-autopairs', event = "InsertEnter", config = true},
  -- Rainbow bracket --
  "HiPhish/rainbow-delimiters.nvim", -- setup is in autopairs


  -- LSP --
  {"neovim/nvim-lspconfig",  -- Collection of configurations for built-in LSP client
  dependencies = {
    "williamboman/mason.nvim",  -- Optional: Handles LSP server installations
    "williamboman/mason-lspconfig.nvim"}},  -- Bridges mason.nvim with lspconfig

  --  Autocompletion --
  "hrsh7th/nvim-cmp",          -- The main autocompletion plugin
  "hrsh7th/cmp-nvim-lsp",    -- LSP source for nvim-cmp
  "hrsh7th/cmp-buffer",      -- Buffer source for nvim-cmp
  "hrsh7th/cmp-path",        -- Path source for nvim-cmp
  "hrsh7th/cmp-cmdline",     -- Cmdline source for nvim-cmp
  "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
  "onsails/lspkind.nvim", -- icons for autocompletion

  {"L3MON4D3/LuaSnip",        -- Snippets plugin
  dependencies = "rafamadriz/friendly-snippets"},

  -- Linters --
  "mfussenegger/nvim-lint",

  -- Formatting --
  'nvimtools/none-ls.nvim',
  "jay-babu/mason-null-ls.nvim",
  "stevearc/conform.nvim",
})


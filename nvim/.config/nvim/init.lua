require("config.lazy").setup {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.telescope') end,
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require('config.lsp')
      lsp.python()
    end,
  },
}

require("config.set")
require("config.remap")
require("config.misc")

vim.cmd[[colorscheme tokyonight-moon]]

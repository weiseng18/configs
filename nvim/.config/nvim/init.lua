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
}

require("config.set")

vim.cmd[[colorscheme tokyonight-moon]]

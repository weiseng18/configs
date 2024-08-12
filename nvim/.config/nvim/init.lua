require("config.lazy").setup {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}

require("config.set")

vim.cmd[[colorscheme tokyonight-moon]]

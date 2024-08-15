require("config.lazy").setup {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
         sidebars = "transparent",
         floats = "transparent",
      },
    },
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
      lsp.lua()
    end,
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  {
	  "L3MON4D3/LuaSnip",
	  lazy = false,
	  dependencies = { "saadparwaiz1/cmp_luasnip" },
	  keys = {
	    {
	      "<C-I>",
	      function() require("luasnip").jump(1) end,
	      desc = "Jump forward a snippet placement",
	      mode = "i",
	      noremap = true,
	      silent = true
	    },
	    {
	      "<C-U>",
	      function() require("luasnip").jump(-1) end,
	      desc = "Jump backward a snippet placement",
	      mode = "i",
	      noremap = true,
	      silent = true
	    }
	  },
	  config = function()
      require("luasnip.loaders.from_lua").load({ paths = "~/repos/configs/nvim/.config/nvim/lua/config/luasnip" })
	  end
	}
}

require("config.set")
require("config.remap")
require("config.misc")
require("config.nvim-cmp")

-- setup colorscheme
vim.cmd[[colorscheme tokyonight-moon]]

-- transparent status line
vim.cmd('hi StatusLine guibg=NONE')
-- noncurrent, e.g. when telescope is running
vim.cmd('hi StatusLineNC guibg=NONE')

-- set line numbers to white/gray for clarity (translucent background)
vim.cmd("hi LineNr guifg=#FFFFFF")
vim.cmd("hi LineNrAbove guifg=#888888")
vim.cmd("hi LineNrBelow guifg=#888888")

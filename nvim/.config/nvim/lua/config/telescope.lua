local builtin = require("telescope.builtin")
local keymap = vim.keymap.set

keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fw', builtin.live_grep, {})

local actions = require("telescope.actions")
require('telescope').setup {
  defaults = {
    -- custom keybindings for actions
    mappings = {
      i = {
        ['<CR>'] = actions.select_tab,
        ['<Esc>'] = actions.close,
      },
    },
  },
}

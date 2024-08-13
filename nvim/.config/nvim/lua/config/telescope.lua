local builtin = require("telescope.builtin")
local keymap = vim.keymap.set

-- find files, including hidden ones
keymap('n', '<leader>ff', function()
  builtin.find_files({
    hidden = true,  -- Include hidden files
  })
end, {})

-- live grep, including hidden files (assumption: underlying is ripgrep)
keymap('n', '<leader>fw', function()
  builtin.live_grep({
    additional_args = function(opts)
      return { "--hidden" }
    end,
  })
end, {})

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

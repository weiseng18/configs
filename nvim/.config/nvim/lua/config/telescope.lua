local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local keymap = vim.keymap.set

-- telescope developers prefer working with buffers
--
-- this function replaces the tab if it is the only blank tab,
-- otherwise it opens in a new tab
local function select_tab_hack(opts)
  local tabpages = vim.api.nvim_list_tabpages()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local buf_list = vim.fn.tabpagebuflist(current_tab)
  local buf_name = vim.fn.bufname(buf_list[1])

  if #tabpages == 1 and buf_name == '' then
    return actions.select_default(opts)
  else
    return actions.select_tab(opts)
  end
end


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

require('telescope').setup {
  defaults = {
    -- custom keybindings for actions
    mappings = {
      i = {
        ['<Esc>'] = actions.close,
        ['<CR>'] = select_tab_hack,
      },
    },
  },
}

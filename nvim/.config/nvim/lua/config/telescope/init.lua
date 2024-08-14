local actions = require("telescope.actions")
local search = require("config.telescope.search")
local keymap = vim.keymap.set

keymap('n', '<leader>ff', search.find_files)
keymap('n', '<leader>fr', search.find_in_repo)
keymap('n', '<leader>fw', search.live_grep)

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

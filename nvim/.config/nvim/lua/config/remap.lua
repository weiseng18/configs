local k = vim.keymap.set

-- get rid of trailing whitespaces
k('n', '<leader>gw', ':%s/\\s\\+$//g<CR>')

-- yank to clipboard
k('n', '<leader>ga', ':%y+<CR>')

local k = vim.keymap.set

-- get rid of trailing whitespaces
k('n', '<leader>gw', ':%s/\\s\\+$//g<CR>')

-- yank to clipboard
k('n', '<leader>ga', ':%y+<CR>')

-- tab navigation
k('n', '˙', 'gT')
k('n', '¬', 'gt')

-- show lsp error in a floating box
k('n', '<leader>er', ':lua vim.diagnostic.open_float()<CR>')

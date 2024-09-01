local v = vim.opt

v.tabstop = 2 -- # of spaces a <Tab> counts for
v.softtabstop = 2 -- # of spaces a <Tab> is when editing
v.expandtab = true -- space instead tab when pressing <Tab>
v.shiftwidth = 2 -- # of spaces to use for each >> and <<
v.relativenumber = true -- line numbers relative to cursor line
v.number = true -- set current line number as actual
v.swapfile = false -- disables swap file
v.backup = false -- disables backup
v.mouse = nil

vim.g.mapleader = ' ' -- set leader to <space>

-- 4 space indentation for CS2103T Java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  command = "setlocal shiftwidth=4 tabstop=4",
})

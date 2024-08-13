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

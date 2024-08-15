vim.cmd('cnoreabbrev te tabedit')

-- vimtex
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_quickfix_ignore_filters = {
  'badness 10000',
}


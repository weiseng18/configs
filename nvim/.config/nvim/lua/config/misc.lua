vim.cmd('cnoreabbrev te tabedit')

-- vimtex
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_quickfix_ignore_filters = {
  'badness 10000',
}

-- lsp border
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single"
  }
)

-- Make sure the border is visible
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ff0000", bg = "NONE" })

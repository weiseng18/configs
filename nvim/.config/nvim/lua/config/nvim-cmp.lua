local cmp = require("cmp")
local ls = require("luasnip")

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      }),
    ['<C-]>'] = function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        vim.cmd('stopinsert')
      end
    end,
    ['<C-[>'] = function(fallback)
      if ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

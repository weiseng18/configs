local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local in_math = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

ls.add_snippets("tex", {
  s({trig="=>", snippetType="autosnippet"},
    fmta([[\implies]], {}),
    { condition = in_math }
  )
})

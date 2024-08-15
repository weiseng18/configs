local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local in_math = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

ls.add_snippets("tex", {
  s({trig="=>", snippetType="autosnippet"},
    fmta([[\implies]], {}),
    { condition = in_math }
  ),

  s({trig="inv", snippetType="autosnippet"},
    fmta([[^{-1}]], {}),
    { condition = in_math }
  ),

  s({trig=">=", snippetType="autosnippet"},
    fmta([[\geq]], {}),
    { condition = in_math }
  ),

  s({trig="<=", snippetType="autosnippet"},
    fmta([[\leq]], {}),
    { condition = in_math }
  ),

  s({trig="->", snippetType="autosnippet"},
    fmta([[\rightarrow]], {}),
    { condition = in_math }
  ),

  s({trig="<-", snippetType="autosnippet"},
    fmta([[\leftarrow]], {}),
    { condition = in_math }
  ),

  s({trig="//", snippetType="autosnippet"},
    fmta([[\\frac{<>}{<>}]], { i(1), i(2) }),
    { condition = in_math }
  ),
})

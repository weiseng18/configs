local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("all", {
  s("ssq",
    fmta(
      [[\section*{Question <>}]],
      { i(1) },
      { delimeters = "<>" }
    )
  ),

  s("bals",
    fmta(
      [[
        \begin{align*}
          <>
        \end{align*}
      ]],
      { i(1) },
      { delimeters = "<>" }
    )
  ),
})


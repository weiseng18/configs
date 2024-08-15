local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("all", {
  s("ssq",
    fmta(
      [[\section*{Question <>}]],
      { i(1) }
    )
  ),

  s("bals",
    fmta(
      [[
        \begin{align*}
          <>
        \end{align*}
      ]],
      { i(1) }
    )
  ),

  s("beql",
    fmta(
      [[
        \begin{equation}\label{eq:<>}
          <>
        \end{equation}
      ]],
      { i(1), i(2) }
    )
  ),
})

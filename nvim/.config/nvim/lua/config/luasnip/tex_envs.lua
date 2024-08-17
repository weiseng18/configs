local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {
  s("ssq",
    fmta(
      [[\section*{Question <>}]],
      { i(1) }
    )
  ),

  s("s2s",
    fmta(
      [[\subsection*{<>}]],
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

  s("ul",
    fmta(
      [[
        \begin{itemize}
          \item <>
        \end{itemize}
      ]],
      { i(1) }
    )
  ),

  s({trig="beg", snippetType="autosnippet"},
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1),  -- this node repeats insert node i(1)
      }
    )
  ),
})

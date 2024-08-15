local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.filetype_extend("tex", { "plaintex" })

ls.add_snippets("plaintex", {
  s("init",
    fmta(
      [[
        \documentclass[a4paper]{article}
        \usepackage[margin=1.2in]{geometry}
        \usepackage{amsmath, amssymb}
        \usepackage{xcolor}

        \usepackage{graphicx}
        \graphicspath{ {./images/} }

        % ref with brackets
        \let\oldref\ref
        \renewcommand{\ref}[1]{(\oldref{#1})}

        \begin{document}
          <>
        \end{document}
      ]],
      { i(1) }
    )
  )
})


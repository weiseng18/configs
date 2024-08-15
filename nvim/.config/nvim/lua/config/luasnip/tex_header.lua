local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("plaintex", {
	s("init", {
		t({
			"\\documentclass[a4paper]{article}",
			"\\usepackage[margin=1.2in]{geometry}",
			"\\usepackage{amsmath, amssymb}",
			"\\usepackage{xcolor}",
			"",
			"\\usepackage{graphicx}",
			"\\graphicspath{ {./images/} }",
			"",
			"% ref with brackets",
			"\\let\\oldref\\ref",
			"\\renewcommand{\\ref}[1]{(\\oldref{#1})}",
			"",
			"\\begin{document}",
			"",
		}),
		i(1),
		t({
			"",
			"\\end{document}",
		}),
	}),
})

local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node

local M = {}

function M.retrieve(not_math)
  local utils = require("luasnip-latex-snippets.util.utils")
  local pipe = utils.pipe

  local conds = require("luasnip.extras.expand_conditions")
  local condition = pipe({ conds.line_begin, not_math })

  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    condition = condition,
  }) --[[@as function]]

  local s = ls.extend_decorator.apply(ls.snippet, {
    condition = condition,
  }) --[[@as function]]

  return {
    s(
      { trig = "ali", name = "Align" },
      { t({ "\\begin{align*}", "\t" }), i(1), t({ "", ".\\end{align*}" }) }
    ),

    parse_snippet({ trig = "beg", name = "begin{} / end{}" }, "\\begin{$1}\n\t$0\n\\end{$1}"),

    s({ trig = "bigfun", name = "Big function" }, {
      t({ "\\begin{align*}", "\t" }),
      i(1),
      t(":"),
      t(" "),
      i(2),
      t("&\\longrightarrow "),
      i(3),
      t({ " \\", "\t" }),
      i(4),
      t("&\\longmapsto "),
      i(1),
      t("("),
      i(4),
      t(")"),
      t(" = "),
      i(0),
      t({ "", ".\\end{align*}" }),
    }),


    s({ trig = "fie", name = "Anki field" }, {
      t({ "\\begin{field}", "\t" }),
      i(1),
      t({ "", "\\end{field}" }),
    }),


    s({ trig = "def", name = "Definition" }, {
      t({ "\\begin{definition}[]", "\t" }),
      i(1),
      t({ "", "\\end{definition}" }),
    }),


    s({ trig = "exmp", name = "Example" }, {
      t({ "\\begin{exmp}[]", "\t" }),
      i(1),
      t({ "", "\\end{exmp}" }),
    }),

    s({ trig = "code", name = "code" }, {
      t({ "\\begin{lstlisting}[frame=single, language=C]", "\t" }),
      i(1),
      t({ "", "\\end{lstlisting}" }),
    }),

    s({ trig = "för", name = "Föredragande" }, {
      t("\\textit{Föredragande: "),
      i(1),
      t("}" ),
    }),

    s({ trig = "bes", name = "Beslut" }, {
      t("\\beslut{"),
      i(1),
      t("}" ),
    }),

    s({ trig = "yrk", name = "Yrkande" }, {
      t("\\yrkande{"),
      i(1),
      t("}{}" ),
    }),


    s({ trig = "line", name = "Line" }, {
      t("\\noindent\\rule{\\textwith}{0.4pt}"),
    }),

    s({ trig = "punkt", name = "Punkt" }, {
      t("\\begin{punkt}{"),
      i(1),
      t({"}", "\t" }),
      i(2),
      t({ "", "\\end{punkt}" }),
    }),


    s({ trig = "under", name = "Underpunkt" }, {
      t("\\begin{underpunkt}{"),
      i(1),
      t({"}", "\t" }),
      i(2),
      t({ "", "\\end{underpunkt}" }),
    }),


    s({ trig = "template", name = "Föredragande" }, {
      t({"\\documentclass[12pt,a4paper,reqno]{amsart} ", "\t"}),
      t({"\\documentclass[12pt,a4paper,reqno]{amsart} ", "\t"}),
      t({"\\usepackage[swedish]{babel} ", "\t"}),
      t({"\\usepackage{amsmath} ", "\t"}),
      t({"\\usepackage{amsfonts} ", "\t"}),
      t({"\\usepackage{amssymb} ", "\t"}),
      t({"\\usepackage{graphicx} ", "\t"}),
      t({"\\usepackage{mathrsfs} ", "\t"}),
      t({"\\usepackage[left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry} ", "\t"}),
      t({"\\author{Gustaf Holmqvist} ", "\t"}),
      t({" ", "\t"}),
      t({" ", "\t"}),
      t({"\\begin{document} ", "\t"}),
      t({"\\title{ } ", "\t"}),
      t({"\\maketitle ", "\t"}),
      t({" ", "\t"}),
      i(1),
      t({" ", "\t"}),
      t({"\\end{document} ", "\t"}),
    }),
  }
end

return M

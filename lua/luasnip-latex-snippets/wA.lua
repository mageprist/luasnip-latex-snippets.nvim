local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe

local M = {}

function M.retrieve(not_math)
  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    condition = pipe({ not_math }),
  }) --[[@as function]]

  return {
    parse_snippet({ trig = "mk", name = "Math" }, "\\( ${1:${TM_SELECTED_TEXT}} \\)$0"),
    parse_snippet({ trig = "dm", name = "Block Math" }, "\\[\n\t${1:${TM_SELECTED_TEXT}}\n.\\] $0"),
    parse_snippet({ trig = "itm", name = "Item" }, "\\item $0"),
    parse_snippet({ trig = "item", name = "Itemize" }, "\\begin{itemize} \n \\item $0 \n \\end{itemize}"),
    parse_snippet({ trig = "enum", name = "Enumerate" }, "\\begin{enumerate} \n \\item $0 \n \\end{enumerate}"),
  }
end

return M

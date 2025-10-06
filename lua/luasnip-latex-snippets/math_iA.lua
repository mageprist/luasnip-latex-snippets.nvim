local M = {}

local ls = require("luasnip")
local f = ls.function_node

function M.retrieve(is_math)
  local utils = require("luasnip-latex-snippets.util.utils")
  local pipe, no_backslash = utils.pipe, utils.no_backslash

  local decorator = {
    wordTrig = false,
    condition = pipe({ is_math, no_backslash }),
  }

  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, decorator) --[[@as function]]
  local s = ls.extend_decorator.apply(ls.snippet, decorator) --[[@as function]]

  return {
    s(
      {
        trig = "(%a+)bar",
        wordTrig = false,
        regTrig = true,
        name = "bar",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\overline{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a+)und",
        wordTrig = false,
        regTrig = true,
        name = "underline",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\underline{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a)dot",
        wordTrig = false,
        regTrig = true,
        name = "dot",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\dot{%s}", snip.captures[1])
      end, {})
    ),

    s(
      {
        trig = "(%a+)hat",
        wordTrig = false,
        regTrig = true,
        name = "hat",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\hat{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a+)ora",
        wordTrig = false,
        regTrig = true,
        name = "ora",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\overrightarrow{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a+)ola",
        wordTrig = false,
        regTrig = true,
        name = "ola",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\overleftarrow{%s}", snip.captures[1])
      end, {})
    ),

    parse_snippet({ trig = "td", name = "to the ... power ^{}" }, "^{$1}$0 "),
    parse_snippet({ trig = "rd", name = "to the ... power ^{()}" }, "^{($1)}$0 "),
    parse_snippet({ trig = "cb", name = "Cube ^3" }, "^3 "),
    parse_snippet({ trig = "sr", name = "Square ^2" }, "^2"),
    parse_snippet({ trig = "sc", name = "Supercube ^4" }, "^4"),

    parse_snippet({ trig = "EE", name = "exists" }, "\\exists "),
    parse_snippet({ trig = "AA", name = "forall" }, "\\forall "),
    parse_snippet({ trig = "xnn", name = "xn" }, "x_{n}"),
    parse_snippet({ trig = "ynn", name = "yn" }, "y_{n}"),
    parse_snippet({ trig = "xii", name = "xi" }, "x_{i}"),
    parse_snippet({ trig = "yii", name = "yi" }, "y_{i}"),
    parse_snippet({ trig = "xjj", name = "xj" }, "x_{j}"),
    parse_snippet({ trig = "yjj", name = "yj" }, "y_{j}"),
    parse_snippet({ trig = "xp1", name = "x" }, "x_{n+1}"),
    parse_snippet({ trig = "xmm", name = "x" }, "x_{m}"),
    
    parse_snippet({ trig = "BB", name = "ball" }, "B(\\overline{0}, r)"),

    parse_snippet({ trig = "notin", name = "not in " }, "\\not\\in "),

    parse_snippet({ trig = "cc", name = "subset" }, "\\subset "),

    parse_snippet({ trig = "<->", name = "leftrightarrow", priority = 200 }, "\\leftrightarrow"),
    parse_snippet({ trig = "...", name = "ldots", priority = 100 }, "\\ldots "),
    parse_snippet({ trig = "!>", name = "mapsto" }, "\\mapsto "),
    parse_snippet({ trig = "iff", name = "iff" }, "\\iff"),
    parse_snippet({ trig = "ooo", name = "\\infty" }, "\\infty"),
    parse_snippet({ trig = "rij", name = "mrij" }, "(${1:x}_${2:n})_{${3:$2}\\in${4:\\N}}$0"),
    parse_snippet({ trig = "nabl", name = "nabla" }, "\\nabla "),
    parse_snippet({ trig = "<!", name = "normal" }, "\\triangleleft "),
    parse_snippet({ trig = "floor", name = "floor" }, "\\left\\lfloor $1 \\right\\rfloor$0"),
    parse_snippet({ trig = "mcal", name = "mathcal" }, "\\mathcal{$1}$0"),
    parse_snippet({ trig = "//", name = "Fraction" }, "\\frac{$1}{$2}$0"),
    parse_snippet({ trig = "\\\\\\", name = "setminus" }, "\\setminus"),
    parse_snippet({ trig = "->", name = "to", priority = 100 }, "\\to "),
    parse_snippet({ trig = "-->", name = "long to", priority = 200 }, "\\longrightarrow "),

    parse_snippet({ trig = "Alp", name = "Alpha", priority = 200}, "\\Alpha "),
    parse_snippet({ trig = "Bet", name = "Beta", priority = 200}, "\\Beta "),
    parse_snippet({ trig = "Chi", name = "Chi", priority = 200}, "\\Chi "),
    parse_snippet({ trig = "Del", name = "Delta", priority = 200}, "\\Delta "),
    parse_snippet({ trig = "Eps", name = "Epsilon", priority = 200}, "\\Epsilon "),
    parse_snippet({ trig = "Gam", name = "Gamma", priority = 200}, "\\Gamma "),
    parse_snippet({ trig = "Iot", name = "Iota", priority = 200}, "\\Iota "),
    parse_snippet({ trig = "Kap", name = "Kappa", priority = 200}, "\\Kappa "),
    parse_snippet({ trig = "Lam", name = "Lambda", priority = 200}, "\\Lambda "),
    parse_snippet({ trig = "Mu", name = "Mu", priority = 200}, "\\Mu "),
    parse_snippet({ trig = "Nu", name = "Nu", priority = 200}, "\\Nu "),
    parse_snippet({ trig = "Ome", name = "Omega", priority = 200}, "\\Omega "),
    parse_snippet({ trig = "Phi", name = "Phi", priority = 200}, "\\Phi "),
    parse_snippet({ trig = "Pi", name = "Pi", priority = 200}, "\\Pi "),
    parse_snippet({ trig = "Psi", name = "Psi", priority = 200}, "\\Psi "),
    parse_snippet({ trig = "Rho", name = "Rho", priority = 200}, "\\Rho "),
    parse_snippet({ trig = "Sig", name = "Sigma", priority = 200}, "\\Sigma "),
    parse_snippet({ trig = "Tau", name = "Tau", priority = 200}, "\\Tau "),
    parse_snippet({ trig = "The", name = "Theta", priority = 200}, "\\Theta "),
    parse_snippet({ trig = "Zet", name = "Zeta", priority = 200}, "\\Zeta "),
    parse_snippet({ trig = "Eta", name = "Eta", priority = 200}, "\\Eta "),

    parse_snippet({ trig = "alp", name = "alpha", priority = 200}, "\\alpha "),
    parse_snippet({ trig = "bet", name = "beta", priority = 200}, "\\beta "),
    parse_snippet({ trig = "chi", name = "chi", priority = 200}, "\\chi "),
    parse_snippet({ trig = "del", name = "delta", priority = 200}, "\\delta "),
    parse_snippet({ trig = "eps", name = "epsilon", priority = 200}, "\\vareps "),
    parse_snippet({ trig = "gam", name = "gamma", priority = 200}, "\\gamma "),
    parse_snippet({ trig = "iot", name = "iota", priority = 200}, "\\iota "),
    parse_snippet({ trig = "kap", name = "kappa", priority = 200}, "\\kappa "),
    parse_snippet({ trig = "lam", name = "lambda", priority = 200}, "\\lambda "),
    parse_snippet({ trig = "mu", name = "mu", priority = 200}, "\\mu "),
    parse_snippet({ trig = "nu", name = "nu", priority = 200}, "\\nu "),
    parse_snippet({ trig = "ome", name = "omega", priority = 200}, "\\omega "),
    parse_snippet({ trig = "phi", name = "phi", priority = 200}, "\\phi "),
    parse_snippet({ trig = "pi", name = "pi", priority = 200}, "\\pi "),
    parse_snippet({ trig = "psi", name = "psi", priority = 200}, "\\psi "),
    parse_snippet({ trig = "rho", name = "rho", priority = 200}, "\\rho "),
    parse_snippet({ trig = "sig", name = "sigma", priority = 200}, "\\sigma "),
    parse_snippet({ trig = "tau", name = "tau", priority = 200}, "\\tau "),
    parse_snippet({ trig = "the", name = "theta", priority = 200}, "\\theta "),
    parse_snippet({ trig = "zet", name = "zeta", priority = 200}, "\\zeta "),
    parse_snippet({ trig = "eta", name = "eta", priority = 200}, "\\eta "),

    parse_snippet({ trig = "siw", name = "sigmaw2", priority = 200}, "\\sigma_w^2 "),

    parse_snippet({ trig = "nnn", name = "bigcap" }, "\\bigcap_{${1:i \\in ${2: I}}} $0"),
    parse_snippet({ trig = "norm", name = "norm" }, "\\|$1\\|$0"),
    parse_snippet({ trig = "<>", name = "hokje" }, "\\diamond "),
    parse_snippet({ trig = ">>", name = ">>" }, "\\gg"),
    parse_snippet({ trig = "<<", name = "<<" }, "\\ll"),

    parse_snippet({ trig = "stt", name = "text subscript" }, "_\\text{$1} $0"),
    parse_snippet({ trig = "tt", name = "text" }, "\\text{$1}$0"),
    parse_snippet({ trig = "bf", name = "text bf" }, "\\textbf{$1}$0"),

    parse_snippet({ trig = "xx", name = "cross" }, "\\times "),

    parse_snippet({ trig = "**", name = "cdot", priority = 100 }, "\\cdot "),

    parse_snippet(
      { trig = "cvec", name = "column vector" },
      "\\begin{pmatrix} ${1:x}_${2:1}\\\\ \\vdots\\\\ $1_${2:n} \\end{pmatrix}"
    ),
    parse_snippet({ trig = "ceil", name = "ceil" }, "\\left\\lceil $1 \\right\\rceil $0"),
    parse_snippet({ trig = "OO", name = "emptyset" }, "\\emptyset"),
    parse_snippet({ trig = "RR", name = "R" }, "\\mathbb{R}"),
    parse_snippet({ trig = "QQ", name = "Q" }, "\\mathbb{Q}"),
    parse_snippet({ trig = "ZZ", name = "Z" }, "\\mathbb{Z}"),
    parse_snippet({ trig = "UU", name = "cup" }, "\\cup "),
    parse_snippet({ trig = "NN", name = "n" }, "\\mathbb{N}"),
    parse_snippet({ trig = "||", name = "mid" }, " \\mid "),
    parse_snippet({ trig = "Nn", name = "cap" }, "\\cap "),
    parse_snippet({ trig = "bmat", name = "bmat" }, "\\begin{bmatrix} $1 \\end{bmatrix} $0"),
    parse_snippet({ trig = "uuu", name = "bigcup" }, "\\bigcup_{${1:i \\in ${2: I}}} $0"),
    parse_snippet({ trig = "DD", name = "D" }, "\\mathbb{D}"),
    parse_snippet({ trig = "HH", name = "H" }, "\\mathbb{H}"),
    parse_snippet({ trig = "lll", name = "l" }, "\\ell"),
    parse_snippet(
      { trig = "dint", name = "integral", priority = 300 },
      "\\int_{${1:-\\infty}}^{${2:\\infty}} ${3:${TM_SELECTED_TEXT}} $0"
    ),

    parse_snippet({ trig = "==", name = "equals" }, [[&= $1 \\\\]]),
    parse_snippet({ trig = "!=", name = "not equals" }, "\\neq "),
    parse_snippet({ trig = "compl", name = "complement" }, "^{c}"),
    parse_snippet({ trig = "__", name = "subscript" }, "_{$1}$0"),
    parse_snippet({ trig = "=>", name = "implies" }, "\\implies"),
    parse_snippet({ trig = "simp", name = "short implies" }, "\\Rightarrow"),
    parse_snippet({ trig = "=<", name = "implied by" }, "\\impliedby"),
    parse_snippet({ trig = "<<", name = "<<" }, "\\ll"),

    parse_snippet({ trig = "<=", name = "leq" }, "\\le "),
    parse_snippet({ trig = ">=", name = "geq" }, "\\ge "),
    parse_snippet({ trig = "invs", name = "inverse" }, "^{-1}"),
    parse_snippet({ trig = "~~", name = "~" }, "\\sim "),
    parse_snippet({ trig = "conj", name = "conjugate" }, "\\overline{$1}$0"),

    parse_snippet({ trig = "Cok", name = "Cokernel" }, "\\text{Coker}($1)"),
    parse_snippet({ trig = "Ker", name = "Kernel" }, "\\text{Ker}($1)"),
    parse_snippet({ trig = "Im", name = "Image" }, "\\text{Im}($1)"),

    parse_snippet({ trig = "cov", name = "covariance" }, "\\text{Cov}($1)"),
    parse_snippet({ trig = "var", name = "variance" }, "\\text{Var}($1)"),
    parse_snippet({ trig = "=-", name = "kongruens" }, "\\equiv"),



    parse_snippet({ trig = "o+", name = "oplus" }, "\\oplus"),
    parse_snippet({ trig = "ox", name = "tensor" }, "\\otimes"),

    parse_snippet({ trig = "vER", name = "verbose" }, "\\verb+$1+"),

    parse_snippet({ trig = "dd", name = "dell" }, "\\partial"),
    parse_snippet({ trig = "iso", name = "isomorphic" }, "\\cong"),
  }
end

return M

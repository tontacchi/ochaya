local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node

local snip_table = {
  -- snippets for go files
  go = {
	s("doc", {
	  t({
		"/*",
        "Preconditions:",
        "",
        "Postconditions:",
        "",
        "Side-effects:",
        "*/",
	  })
	})
  }
}

return snip_table

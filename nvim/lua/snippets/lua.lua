local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
  s("fn", {
	t("function "), i(1, "name"), t("()"),
	t({ "", "\t" }), i(2),
	t({ "", "end" }),
  }),
})


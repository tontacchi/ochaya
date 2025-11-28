local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
  s("t2", {
	t("| "), i(1), t(" | "), i(2), t(" |"), t(""),
	t("| :-: | :-: |"), t(""),
  }),
})

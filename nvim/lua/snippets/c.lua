local luasnip = require("luasnip");
local snippet      = luasnip.snippet;
local textNode     = luasnip.text_node;
local insertNode   = luasnip.insert_node;
local functionNode = luasnip.function_node;

local snippetsTable = {
	snippet("stru", {
		textNode({"typedef struct "}),
		insertNode(1, ""),
		textNode({" {", "\t", "}"}),
		insertNode(2, ""),
		textNode(";"),
	}),
};

return snippetsTable;

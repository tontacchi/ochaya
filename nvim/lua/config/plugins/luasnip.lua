local luasnipTable = {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.3", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = "make install_jsregexp",
		config = function()
		  require("luasnip.loaders.from_lua").lazy_load({
			paths = {
			  "~/.config/nvim/lua/snippets/lua.lua",
			  "~/.config/nvim/lua/snippets/markdown.lua",
			}
		  })
		end
	},
};

return luasnipTable;

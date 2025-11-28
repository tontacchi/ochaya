local lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },

	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	-- settings = {
	--     Lua = {
	--         diagnostics = {
	--             --     disable = { "missing-parameters", "missing-fields" },
	--         },
	--     },
	-- },

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}

return lua_ls

local emmet_ls = {
	-- Command to start the language server
	cmd = { "emmet-ls", "--stdio" },

	-- Filetypes emmet-ls supports explicitly
	filetypes = {
		"html",
		"javascriptreact",
		"typescriptreact",
	},
}

return emmet_ls

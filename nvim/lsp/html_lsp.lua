local html_ls = {
	-- Command to start the language server
	cmd = { "vscode-html-language-server", "--stdio" },

	-- Filetypes html-lsp supports explicitly
	filetypes = {
		"html",
	},
}

return html_ls


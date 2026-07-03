return {
    -- Command to start the language server
	cmd = { "tsgo", "--lsp", "--stdio" },

	-- File types that this server will handle
	filetypes = { "typescript", "typescriptreact" },

	-- Markers to identify the root of the project
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
}

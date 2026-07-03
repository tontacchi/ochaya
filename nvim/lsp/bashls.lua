return {
	-- Command to start the Bash language server
	cmd = { "bash-language-server", "start" },

	-- File types that this server will handle
	filetypes = { "sh", "bash" },

	-- Markers used to identify the project root
	root_markers = { ".git" },

	-- Optional Bash-specific settings
	settings = {
		bashIde = {
			globPattern = "**/*@(.sh|.inc|.bash|.command)",
		},
	},
}

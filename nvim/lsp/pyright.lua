return {
	-- Command used to start Pyright
	cmd = { "pyright-langserver", "--stdio" },

	-- Python files handled by this server
	filetypes = { "python" },

	-- Markers used to find the project root
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},

	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "basic",
			},
		},
	},
}

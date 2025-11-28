return {
	-- Command to start the language server
	cmd = {
		"clangd",
		"--background-index",        -- index project code in the background
		"--clang-tidy",              -- run clang-tidy diagnostics
		"--completion-style=detailed",
		"--header-insertion=iwyu",   -- include-what-you-use style headers
		"--pch-storage=memory",      -- faster at the cost of more RAM
	},

	-- File types that this server will handle
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

	-- Markers to identify the root of the project
	root_markers = {
		"compile_commands.json",     -- CMake / build-system compilation DB
		"compile_flags.txt",         -- simple flags file
		".clangd",                   -- clangd project config
		".git",
	},

	-- Settings for the language server
	-- (clangd doesn't use as many settings as gopls; most behavior is via flags or .clangd)
	settings = {
		clangd = {
			-- If you want a default standard when compile_commands.json is missing:
			-- fallbackFlags = { "-std=c++20" },

			-- Example: tweak how diagnostics behave (clang-tidy controls a lot of this too)
			-- diagnostics = {
			-- 	-- "clang" / "clang-tidy" / "all"
			-- 	clangTidy = true,
			-- },
		},
	},

	-- Extra initialization options (sent in initialize request, not as settings)
	init_options = {
		usePlaceholders = true,       -- function param placeholders in completion
		completeUnimported = true,    -- suggest symbols from headers not yet included
		clangdFileStatus = true,      -- show file status in e.g. statusline plugins
	},
}


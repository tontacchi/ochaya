local ignore_patterns = {
	-- build output
	"build/",

	-- python files
	"venv/",
	"%.pyc$",
	"%.pickle$",
	"requirements%.txt$",

	-- node modules
	"node_modules/",

	-- git directories
	"%.git/",

	-- gcc intermediate compilation outputs
	"%.out$",
	"%.o$",
	"%.i$",
	"%.s$",

	-- databases
	"%.db$",

	-- images
	"%.png$",
	"%.jpeg$",
	"%.jpg$",
	"%.gif$",
	"%.webp$",

	-- videos
	"%.mp4$",

	-- wails
	"frontend/",
	"wailsjs/",
	"dist/",
}

local function builtin(name, opts)
	return function()
		require("telescope.builtin")[name](opts or {})
	end
end

local M = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",

		cmd = "Telescope",

		keys = {
			{ "<space>pf", builtin("find_files"), desc = "Find files" },
			{ "<space>pg", builtin("live_grep"), desc = "Live grep" },
			{ "<space>ps", builtin("lsp_document_symbols"), desc = "Document symbols" },
			{ "<space>pt", builtin("treesitter"), desc = "Treesitter symbols" },
			{ "gr", builtin("lsp_references"), desc = "Goto references" },

			{ "<space>tbi", "<cmd>Telescope telescope<cr>", desc = "Telescope builtins" },
			{ "<space>th", builtin("help_tags"), desc = "Help tags" },
			{ "<space>tu", "<cmd>Telescope undo<cr>", desc = "Telescope undo" },

			{
				"<leader>pw",
				function()
					require("telescope.builtin").lsp_workspace_symbols({
						query = vim.fn.input("Symbol: "),
					})
				end,
				desc = "Workspace symbol",
			},

			{
				"<space>en",
				function()
					require("telescope.builtin").find_files({
						cwd = vim.fn.stdpath("config"),
					})
				end,
				desc = "Edit Neovim config",
			},

			{
				"<space>ep",
				function()
					require("telescope.builtin").find_files({
						cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
					})
				end,
				desc = "Edit plugin sources",
			},
		},

		dependencies = {
			"nvim-lua/plenary.nvim",

			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},

			"debugloop/telescope-undo.nvim",
		},

		config = function()
			local telescope = require("telescope")

			telescope.setup({
				extensions = {
					fzf = {},
					undo = {},
				},

				defaults = {
					file_ignore_patterns = ignore_patterns,
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("undo")
		end,
	},
}

return M

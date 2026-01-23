local telescope_table = {{
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make"
		},
		"debugloop/telescope-undo.nvim",
	},
	config = function()
		local scope = require("telescope")

		scope.setup({
			extensions = {
				fzf = {},
				undo = {},
			},
			defaults = {
				file_ignore_patterns = {
					-- python files
					"venv/",
					"%.pyc$",
					"%.pickle",
					"requirements.txt",

					-- node modules
					"node_modules",

					-- git directories
					".git/",

					-- gcc intermediate compilation outputs
					"%.out",
					"%.o",
					"%.i",
					"%.s",

					-- databases
					"%.db",

					-- images
					"%.png",
					"%.jpeg",
					"%.jpg",
					"%.gif",
				},
			}
		})

		scope.load_extension("fzf")
		scope.load_extension("undo")
		-- scope.load_extension("noice")

		local telescope = require("telescope.builtin")

		vim.keymap.set("n", "<space>pf", telescope.find_files)
		vim.keymap.set("n", "<space>pg", telescope.live_grep)
		vim.keymap.set("n", "<space>ps", telescope.lsp_document_symbols)
		-- vim.keymap.set("n", "<space>pw", telescope.lsp_workspace_symbols)
		vim.keymap.set('n', '<space>pt', telescope.treesitter, { desc = '[T]reesitter [S]ymbols' })

		vim.keymap.set('n', 'gr', telescope.lsp_references, { desc = '[G]oto [R]eferences' })

		vim.keymap.set("n", "<space>tbi", "<cmd>Telescope telescope<cr>")
		vim.keymap.set("n", "<space>th",  telescope.help_tags)

		-- Custom function if you want to prompt for query:
		vim.keymap.set('n', '<leader>pw', function() telescope.lsp_workspace_symbols({ query = vim.fn.input('Symbol: ') }) end, { desc = '[F]ind [W]orkspace symbol' })

		-- "edit neovim"
		vim.keymap.set("n", "<space>en", function()
			local nvimDirTable = {
				cwd = vim.fn.stdpath("config")
			}

			telescope.find_files(nvimDirTable)
		end)

		-- "edit plugin sources"
		vim.keymap.set("n", "<space>ep", function()
			local nvimDirTable = {
				cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
			}

			telescope.find_files(nvimDirTable)
		end)

		-- "telescope undo"
		vim.keymap.set("n", "<space>tu", "<cmd>Telescope undo<cr>")
	end
}}

return telescope_table
-- return {}

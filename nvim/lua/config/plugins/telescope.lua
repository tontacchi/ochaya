local telescopeTable = {
  {
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
			"venv/",             -- Ignore the virtual environment directory
			"%.pyc$",            -- Example: Ignore compiled Python files
			".git/",             -- Ignore Git directories
			"requirements.txt",
			"%.out",
			"%.o",
			"%.i",
			"%.s",
			"%.pickle",
			"%.db"
		  },
		}
	  })

	  scope.load_extension("fzf")
	  scope.load_extension("undo")
	  -- scope.load_extension("noice")

	  local builtin = require("telescope.builtin")

	  vim.keymap.set("n", "<space>pf", builtin.find_files)
	  vim.keymap.set("n", "<space>pg", builtin.live_grep)
	  vim.keymap.set("n", "<space>pds", builtin.lsp_document_symbols)

	  vim.keymap.set("n", "<space>tbi", "<cmd>Telescope builtin<cr>")
	  vim.keymap.set("n", "<space>th",  builtin.help_tags)

	  -- "edit neovim"
	  vim.keymap.set("n", "<space>en", function()
		local nvimDirTable = {
		  cwd = vim.fn.stdpath("config")
		}

		builtin.find_files(nvimDirTable)
	  end)

	  -- "edit plugin sources"
	  vim.keymap.set("n", "<space>ep", function()
		local nvimDirTable = {
		  cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
		}

		builtin.find_files(nvimDirTable)
	  end)

	  -- "telescope undo"
	  vim.keymap.set("n", "<space>tu", "<cmd>Telescope undo<cr>")

	  require("config.telescope.multigrep").setup()
	end
  }
}

return telescopeTable

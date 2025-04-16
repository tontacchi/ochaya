local oil = {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = {
			{
				"echasnovski/mini.icons",
				opts = {}
			}
		},
		config = function()
			require("oil").setup(
				{
					default_file_explorer = true,
					skip_confirm_for_simple_edits = true,
				}
			)

			-- replaces pv -> :Ex for netrw
			vim.keymap.set("n", "-", "<cmd>Oil<cr>")
		end
	}
}

return oil

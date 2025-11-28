local noiceTable = {
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify"
		},
		event = "VeryLazy",
		opts = {
			-- neovim's default messages
			messages = {
				enabled = false,
			},
			lsp = {
				progress = {
					enabled = true, -- LSP progress messages
				},
				message = {
					enabled = false,
				},
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				}
			},
			presets = {
				command_palette = true,
				bottom_search = false,
			},
			routes = {
				{ filter = { find = "E162" }, view = "mini" },
				{ filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" },
				{ filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
				{ filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
				{ filter = { event = "emsg", find = "E23" }, skip = true },
				{ filter = { event = "emsg", find = "E20" }, skip = true },
				{ filter = { find = "No signature help" }, skip = true },
				{ filter = { find = "E37" }, skip = true },
			}
		}
	},
}

return noiceTable

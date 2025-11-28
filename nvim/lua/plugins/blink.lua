local blinkConfigFunc = function()
	local blinkCmp = require("blink.cmp")
	local setupTable = {
		snippets   = { preset = "luasnip" },
		signature  = { enabled = true },
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "normal",
		},
		sources    = {
			default   = { "lsp", "path", "snippets", "buffer" },
			providers = {
				cmdline = {
					min_keyword_length = 2,
				},
			},
		},
		keymap = {
			["<C-f>"] = {},
		},
		cmdline = {
			enabled = false,
			completion = { menu = { auto_show = true } },
			keymap = {
				["<CR>"] = { "accept_and_enter", "fallback" },
			},
		},
		completion = {
			menu = {
				border = "rounded",
				scrolloff = 1,
				scrollbar = false,
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label",      "label_description", gap = 1 },
						{ "kind" },
						{ "source_name" },
					},
				},
			},
			documentation = {
				window = {
					border = "rounded",
					scrollbar = false,
					winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
				},
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},
	}

	blinkCmp.setup(setupTable)
	require("luasnip.loaders.from_vscode").lazy_load()
end

local blinkTable = {
	-- LuaSnip
	{
		"L3MON4D3/LuaSnip",
		keys = {}
	},
	-- blink
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "*",
		config = blinkConfigFunc,
	}
}

return blinkTable

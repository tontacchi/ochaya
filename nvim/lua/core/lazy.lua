-- changelog:
-- 2026-01-25 -> merged config.lazy (from v0.10) + core.lazy (v0.11)

-- core/lazy.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
	"https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local spec = {
	{ import = "plugins" }, -- keep your CURRENT convention

	-- if you want kanagawa managed here (optional)
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
}

local opts = {
	install = {
		missing = true,
		colorscheme = { "kanagawa-wave", "habamax" },
	},
	checker = { enabled = true, notify = false },
	change_detection = { enabled = true, notify = false },
	ui = {
		icons = {
			cmd = " ",
			config = "",
			event = " ",
			favorite = " ",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			require = "󰢱 ",
			source = " ",
			start = " ",
			task = "✔ ",
			list = { "●", "➜", "★", "‒" },
		},
	},
	performance = {
		rtp = {
			disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
		},
	},
}

require("lazy").setup(spec, opts)


-- local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
--
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--     local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
--     local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
--
--     if vim.v.shell_error ~= 0 then
--         error('Error cloning lazy.nvim:\n' .. out)
--     end
-- end ---@diagnostic disable-next-line: undefined-field
--
-- vim.opt.rtp:prepend(lazypath)
--
-- require("lazy").setup({ import = "plugins" }, {
--     install = {
--         missing = true,
--         colorscheme = { "habamax" }
--     },
--     checker = {
--         enabled = true,
--         notify = false,
--     },
--     change_detection = {
--         enabled = true,
--         notify = false,
--     },
--     ui = {
--         -- border = "rounded"
--     },
--     performance = {
--         rtp = {
--             disabled_plugins = {
--                 "gzip",
--                 "tarPlugin",
--                 "tohtml",
--                 "tutor",
--                 "zipPlugin",
--             },
--         },
--     },
-- })

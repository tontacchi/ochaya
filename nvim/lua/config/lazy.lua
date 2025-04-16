-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
	vim.api.nvim_echo({
	    { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
	    { out, "WarningMsg" },
	    { "\nPress any key to exit..." },
	}, true, {})
	vim.fn.getchar()
	os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- setting up `mapleader` & `maplocalleader` before loading lazy.nvim to ensure correct mappings
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
local lazyTable = {
    spec = {
		-- import plugins
		{
			import = "config.plugins"
		},

		-- importing a color scheme	
		{
		  "rebelot/kanagawa.nvim",
		  config = function() vim.cmd.colorscheme("kanagawa-wave") end
		},
		-- {
		-- 	"folke/tokyonight.nvim",
		-- 	config = function() vim.cmd.colorscheme("tokyonight-night") end
		-- },
		-- {
		-- 	"sainnhe/everforest",
		-- 	config = function() vim.cmd.colorscheme("everforest-dark") end
		-- }
    },
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
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		}
	}
}

require("lazy").setup(lazyTable)


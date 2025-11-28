require("options")            -- Load options
require("keymaps")            -- Load key mappings
require("autocmds")           -- Load auto commands
require("config.lazy")        -- looks for ~/.config/nvim/lua/config/lazy.lua
require("config.appearance")

-- ignore - ex: something in .md files please
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
	vim.opt_local.modeline = false
  end,
  group = vim.api.nvim_create_augroup("MarkdownNoModeline", { clear = true }),
})


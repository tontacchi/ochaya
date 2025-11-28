vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true

vim.opt.signcolumn = 'yes'

--vim.opt.nobackup = true
vim.opt.scrolloff = 8
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.foldmethod = "syntax"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""

vim.opt.whichwrap:append {
	['<'] = true,
	['>'] = true,
	['['] = true,
	[']'] = true,
	h = true,
	l = true,
}

vim.wo.wrap = false
vim.wo.linebreak = true
vim.wo.list = false -- extra option I set in addition to the ones in your question

vim.o.foldlevelstart = 1

-- redundant w/ mini status bar. enable if status bar is gone
vim.opt.showmode = false

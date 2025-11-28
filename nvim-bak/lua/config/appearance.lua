-- Make the background transparent
vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine",   { bg = "none", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#aaaaaa" })
vim.api.nvim_set_hl(0, "LineNr",       { bg = "none", fg = "#f7e29c" })
vim.api.nvim_set_hl(0, "LineNrAbove",  { bg = "none", fg = "#c8c093" })
vim.api.nvim_set_hl(0, "LineNrBelow",  { bg = "none", fg = "#c8c093" })
vim.api.nvim_set_hl(0, "SignColumn",   { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine",   { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn",   { bg = "none" })

-- autocomplete menu
vim.api.nvim_set_hl(0, "Pmenu",        { bg = "none", fg = "#ada179" })
vim.api.nvim_set_hl(0, "PmenuSel",     { fg = "#c8c093", bold = true })
vim.api.nvim_set_hl(0, "PmenuKind",    { bg = "none", fg = "#ada179" })
vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = "#c8c093", bold = true })
vim.api.nvim_set_hl(0, "PmenuSbar",    { bg = "none" })

-- transparent mini.statusline
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = "none", fg = "#c8c093" })
vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { bg = "none", fg = "#c8c093" })
vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo",  { bg = "none", fg = "#c8c093" })

-- Telescope borders
local curr_telescope_border_fg = vim.api.nvim_get_hl(0, { name = "TelescopeBorder" }).fg
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = curr_telescope_border_fg })

-- floating window borders
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa", bg = "none" })

-- Noice Command Line borders
local curr_function_fg = vim.api.nvim_get_hl(0, { name = "Function" }).fg
-- local curr_diagonstic_sign_info = vim.api.nvim_get_hl(0, { name = "DiagnosticSignInfo" }).fg
local curr_diagonstic_sign_warn = vim.api.nvim_get_hl(0, { name = "DiagnosticSignWarn" }).fg
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "none", fg = curr_function_fg })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { bg = "none", fg = curr_function_fg })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { bg = "none", fg = curr_diagonstic_sign_warn })
vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { bg = "none", fg = curr_diagonstic_sign_warn })

-- comment line color 
vim.api.nvim_set_hl(0, "Comment", { fg = "#aaa0a0" })

-- Make folded lines have a transparent background
vim.api.nvim_set_hl(0, "Folded", {
    fg = "#878787",   -- Foreground color
    bg = "NONE",      -- Transparent background
    ctermfg = 102,    -- Terminal foreground color
    ctermbg = "NONE"  -- Terminal background (transparent)
})
vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none", fg = "#aaaaaa" }) -- For the fold column on the left

-- set characters after line fold as blank
vim.opt.fillchars:append({ fold = " " })

vim.api.nvim_set_hl(0, "@boolean.lua", { bold = false, fg = "#FA9C2B" })
vim.api.nvim_set_hl(0, "@boolean.python", { bold = false, fg = "#FA9C2B" })
vim.api.nvim_set_hl(0, "@boolean.kotlin", { bold = false, fg = "#FA9C2B" })


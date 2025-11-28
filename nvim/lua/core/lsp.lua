-- vim -> global variable
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- Declare 'vim' as a global variable
            },
            -- Other Lua LS settings can go here, e.g.:
            -- runtime = {
            --   version = "LuaJIT",
            -- },
            -- workspace = {
            --   library = vim.api.nvim_get_runtime_file("", true),
            -- },
        },
    },
})

-- start language servers, engage protocol
vim.lsp.enable({
    "gopls",
    "lua_ls",
	"clangd",
})

-- diagnostic info
vim.diagnostic.config({
    -- virtual_lines = true,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})


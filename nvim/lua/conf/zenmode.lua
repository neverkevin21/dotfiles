require("zen-mode").setup({
    window = {
        -- backdrop = 0.95,
        width = 110,
        options = {
            number = true,
            relativenumber = false,
            signcolumn = "no",
            cursorcolumn = false,
        },
    },
    plugins = {
        kitty = {
            enabled = true,
            font = "+4",
        },
    },
})

require'bufferline'.setup({
    options = {
        diagnostics = "nvim_lsp",
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            -- text = function ()
            --     return vim.fn.getcwd()
            -- end,
            highlight = "Pmenu",
            text_align = "left",
            separator = true,
        }}
    }
})

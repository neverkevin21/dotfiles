return {
    {
        "stevearc/conform.nvim",
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    sql = { "sqlfmt" },
                    html = { "htmlbeautifier", "prettier" }
                },
            })
        end,
    },
}

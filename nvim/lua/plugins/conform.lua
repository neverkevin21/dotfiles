return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					javascript = { "prettierd", "prettier", stop_after_first = true },
					sql = { "sqlfmt" },
					html = { "htmlbeautifier", "prettier" },
					lua = { "stylua" },
					json = { "prettier" },
					toml = { "taplo" },
					yaml = { "prettier" },
				},
				-- Conform will notify you when a formatter errors
				notify_on_error = true,
				-- Conform will notify you when no formatters are available for the buffer
				notify_no_formatters = true,
			})
		end,
	},
}

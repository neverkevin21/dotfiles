local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.sqlfmt,
		null_ls.builtins.formatting.buf,

        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.impl,
		-- null_ls.builtins.completion.spell,
		-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
	},
})

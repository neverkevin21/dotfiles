return {
	{
		"onsails/lspkind-nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"ray-x/lsp_signature.nvim",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	},
	{
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
		},
		branch = "nvim_0.9",
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
}

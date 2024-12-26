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
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup({
				settings = {
					search = {
						vscode_venvs = {
							command = "fd /bin/python$ ~/vs-workspace -H --full-path",
						},
						home_venvs = {
							command = "fd /bin/python$ ~/.venv -H --full-path",
						},
					},
				},
			})
		end,
		keys = {
			-- { ",vs", "<cmd>VenvSelect<cr>" },
		},
	},
	{
		"nvimtools/none-ls.nvim",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_setup = true,
				ensure_installed = { "shfmt", "prettier", "stylua" },
				handlers = {},
			})
		end,
	},
}

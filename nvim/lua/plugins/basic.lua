return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"folke/zen-mode.nvim",
	},
	{
		-- TODO: TODO
		-- WARN: WARN
		-- FIX:  FIX
		-- HACK: HACK
		-- NOTE: NOTE
		-- PERF: PERF
		-- TEST: TEST
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({
				keywords = {
					FIX = {
						icon = " ", -- icon used for the sign, and in search results
						color = "error", -- can be a hex color, or a named color (see below)
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
						-- signs = false, -- configure signs for some keywords individually
					},
					TODO = { icon = " ", color = "todo" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = "󱢍", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "info", alt = { "INFO" } },
					TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				},
				colors = {
					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
					todo = { "DiagnosticOk", "#2563EB" },
					info = { "DiagnosticInfo", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test = { "Identifier", "#FF00FF" },
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup()
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            {
                "S",
                mode = { "n", "o", "x" },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
		config = function()
			require("flash").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				toggler = {
					line = "<C-/>",
					block = "<C-?>",
				},
				opleader = {
					line = "<C-/>",
					block = "<C-?>",
				},
			})
		end,
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- configuration goes here
		},
		config = function()
			require("leetcode").setup({
				---@type string
				arg = "leetcode.nvim",

				---@type lc.lang
				lang = "golang",

				cn = { -- leetcode.cn
					enabled = true, ---@type boolean
					translator = true, ---@type boolean
					translate_problems = true, ---@type boolean
				},

				---@type lc.storage
				storage = {
					home = vim.fn.stdpath("data") .. "/leetcode",
					cache = vim.fn.stdpath("cache") .. "/leetcode",
				},

				---@type table<string, boolean>
				plugins = {
					non_standalone = false,
				},

				---@type boolean
				logging = true,

				injector = {}, ---@type table<lc.lang, lc.inject>

				cache = {
					update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
				},

				console = {
					open_on_runcode = true, ---@type boolean

					dir = "row", ---@type lc.direction

					size = { ---@type lc.size
						width = "90%",
						height = "75%",
					},

					result = {
						size = "60%", ---@type lc.size
					},

					testcase = {
						virt_text = true, ---@type boolean

						size = "40%", ---@type lc.size
					},
				},

				description = {
					position = "left", ---@type lc.position

					width = "40%", ---@type lc.size

					show_stats = true, ---@type boolean
				},

				hooks = {
					---@type fun()[]
					["enter"] = {},

					---@type fun(question: lc.ui.Question)[]
					["question_enter"] = {},

					---@type fun()[]
					["leave"] = {},
				},

				keys = {
					toggle = { "q" }, ---@type string|string[]
					confirm = { "<CR>" }, ---@type string|string[]

					reset_testcases = "r", ---@type string
					use_testcase = "U", ---@type string
					focus_testcases = "H", ---@type string
					focus_result = "L", ---@type string
				},

				---@type lc.highlights
				theme = {},

				---@type boolean
				image_support = false,
			})
		end,
	},
	{
		"voldikss/vim-floaterm",
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		opts = {
			rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
		},
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup()
			-- first load extension
			require("telescope").load_extension("rest")
		end,
	},
	{
		"github/copilot.vim",
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
		},
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"stevearc/dressing.nvim",
	},
}

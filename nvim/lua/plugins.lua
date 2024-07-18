require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd([[colorscheme tokyonight]])
        end
    },
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("dracula").setup({
                -- customize dracula color palette
                colors = {
                },
                -- show the '~' characters after the end of buffers
                show_end_of_buffer = true,    -- default false
                -- use transparent background
                transparent_bg = true,        -- default false
                -- set custom lualine background color
                lualine_bg_color = "#44475a", -- default nil
                -- set italic comment
                italic_comment = true,        -- default false
                -- overrides the default highlights see `:h synIDattr`
                overrides = {
                    -- Examples
                    -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
                    -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
                    -- Nothing = {} -- clear highlight of Nothing
                },
            })
            -- vim.cmd([[colorscheme dracula]])
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.cmd([[colorscheme catppuccin-macchiato]])
        end
    },
    "L3MON4D3/LuaSnip",
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    "saadparwaiz1/cmp_luasnip",
    "golang/vscode-go",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "hrsh7th/vim-vsnip-integ",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "lukas-reineke/cmp-under-comparator",
    "onsails/lspkind-nvim",
    "ray-x/lsp_signature.nvim",
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    {
        "nvim-telescope/telescope.nvim",
        version = "v0.1.1",
        dependencies = {
            "BurntSushi/ripgrep",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-symbols.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                version = "^1.0.0",
            },
        },
        opts = function(_, opts)
            local function flash(prompt_bufnr)
                require("flash").jump({
                    pattern = "^",
                    label = { after = { 0, 0 } },
                    search = {
                        mode = "search",
                        exclude = {
                            function(win)
                                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
                            end,
                        },
                    },
                    action = function(match)
                        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                        picker:set_selection(match.pos[1] - 1)
                    end,
                })
            end
            opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
                mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
            })
        end,
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
            "nvim-treesitter/nvim-treesitter"
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    "folke/zen-mode.nvim",
    "folke/todo-comments.nvim",
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        -- config = function()
        --     require("go").setup()
        -- end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    "voldikss/vim-floaterm",
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
        end
    },
    "nvim-lualine/lualine.nvim",
    {
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap",
        "leoluz/nvim-dap-go",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },
    "github/copilot.vim",
    "simrat39/rust-tools.nvim",
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require("mini.surround").setup()
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
        "rest-nvim/rest.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("rest-nvim").setup({
                --- Get the same options from Packer setup
            })
        end
    },
    {
        'mhartington/formatter.nvim',
        config = function()
            local util = require("formatter.util")
            require("formatter").setup {
                logging = true,
                filetype = {
                    ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace,
                    },
                    go = {
                        function()
                            return {
                                exe = "gofumpt",
                                args = { "-e" },
                                stdin = true,
                            }
                        end,
                    },
                },
            }
        end
    },
    {
        "kndndrj/nvim-dbee",
        enabled = true,
        dependencies = { "MunifTanjim/nui.nvim" },
        build = function()
            require("dbee").install("go")
        end,
        config = function()
            local source = require "dbee.sources"
            require("dbee").setup {
                sources = {
                    source.MemorySource:new({
                        ---@diagnostic disable-next-line: missing-fields
                        {
                            name = "local-redis",
                            type = "redis",
                            url = "redis://"
                        },
                    }),
                },
            }
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
            require("leetcode").setup {
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
            }
        end
    }
})

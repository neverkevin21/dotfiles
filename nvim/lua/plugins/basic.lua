return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = false },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        keys = {
            -- Top Pickers & Explorer
            { "<C-p>",      function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
            { "<leader>b",  function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
            { "<C-f>",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
            { "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Command History" },
            { "<leader>n",  function() Snacks.picker.notifications() end,                           desc = "Notification History" },
            { "\\",         function() Snacks.explorer() end,                                       desc = "File Explorer" },
            -- find
            { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
            { "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
            { "<leader>fp", function() Snacks.picker.projects() end,                                desc = "Projects" },
            { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
            -- git
            { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
            { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
            { "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Git Status" },
            { "<leader>gS", function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
            { "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
            -- Grep
            { "<leader>sb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
            { "<leader>sB", function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
            { "<leader>sg", function() Snacks.picker.grep() end,                                    desc = "Grep" },
            { "<leader>sw", function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
            -- search
            -- { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
            { '<leader>s/', function() Snacks.picker.search_history() end,                          desc = "Search History" },
            -- { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
            -- { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
            -- { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
            { "<leader>c",  function() Snacks.picker.commands() end,                                desc = "Commands" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
            { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
            { "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
            { "<leader>sH", function() Snacks.picker.highlights() end,                              desc = "Highlights" },
            { "<leader>si", function() Snacks.picker.icons() end,                                   desc = "Icons" },
            { "<leader>sj", function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
            { "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
            { "<leader>sl", function() Snacks.picker.loclist() end,                                 desc = "Location List" },
            { "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
            { "<leader>sM", function() Snacks.picker.man() end,                                     desc = "Man Pages" },
            { "<leader>sp", function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
            { "<leader>sq", function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
            { "<leader>sR", function() Snacks.picker.resume() end,                                  desc = "Resume" },
            { "<leader>su", function() Snacks.picker.undo() end,                                    desc = "Undo History" },
            { "<leader>uC", function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
            -- LSP
            -- { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
            -- { "gD",         function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
            { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
            { "<leader>i",  function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
            -- { "gt",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
            { "<space>o",   function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
            { "<leader>o",  function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
            -- Other
            { "<leader>z",  function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
            { "<leader>Z",  function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
            -- { "<leader>.",  function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
            -- { "<leader>S",  function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
            { "<leader>n",  function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
            { "<leader>bd", function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
            { "<leader>cR", function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
            { "<leader>gB", function() Snacks.gitbrowse() end,                                      desc = "Git Browse",               mode = { "n", "v" } },
            -- { "<leader>gg", function() Snacks.lazygit() end,                                        desc = "Lazygit" },
            { "<leader>un", function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
            { "<C-j>",      function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
            -- { "<c-_>",      function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
            -- { "]]",         function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
            -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },
        },
        config = function()
            vim.keymap.set("t", "<C-j>", "<C-\\><C-n><CMD>lua Snacks.terminal()<CR>")
            require("snacks").setup()
        end,
    },
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
            vim.keymap.set("n", "<leader>q", ":BufferLineCyclePrev<CR>")
            vim.keymap.set("n", "<leader>e", ":BufferLineCycleNext<CR>")
            vim.keymap.set("n", "<leader>ws", ":BufferLinePick<CR>")
            vim.keymap.set("n", "<leader>wd", ":BufferLinePickClose<CR>")
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
        -- "voldikss/vim-floaterm",
        "numToStr/FTerm.nvim",
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
            "echasnovski/mini.pick",         -- optional
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
        "mistricky/codesnap.nvim",
        build = "make",
        keys = {
            { "<leader>cc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
            { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
        },
        opts = {
            save_path = "~/Pictures",
            has_breadcrumbs = true,
            bg_theme = "bamboo",
        },
        config = function()
            require("codesnap").setup({
                code_font_family = "Hack Nerd Font",
                bg_padding = 0,
                has_breadcrumbs = true,
                has_line_number = true,
            })
        end,
    },
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        -- AIzaSyAwiWXPfRvvl9tz86EYjyL4_-KIn_QmooU
        config = function()
            require("codecompanion").setup({
                adapters = {
                    gemini = function()
                        return require("codecompanion.adapters").extend("gemini", {
                            env = {
                                api_key = "AIzaSyAwiWXPfRvvl9tz86EYjyL4_-KIn_QmooU",
                            },
                        })
                    end,
                },
            })
        end,
    },
}

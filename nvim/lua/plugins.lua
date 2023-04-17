require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
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
                show_end_of_buffer = true, -- default false
                -- use transparent background
                transparent_bg = true, -- default false
                -- set custom lualine background color
                lualine_bg_color = "#44475a", -- default nil
                -- set italic comment
                italic_comment = true, -- default false
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
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
    },
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "hrsh7th/nvim-cmp",
    "golang/vscode-go",
    "hrsh7th/vim-vsnip-integ",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind-nvim",
    "ray-x/lsp_signature.nvim",
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
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
        }
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
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    "windwp/nvim-autopairs",
    "voldikss/vim-floaterm",
    "numToStr/Comment.nvim",
    "nvim-lualine/lualine.nvim",
    {
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap"
    },
    {
        "github/copilot.vim",
    },
    {
        "simrat39/rust-tools.nvim"
    }
})

-- local Plug = vim.fn['plug#']
--
-- vim.call('plug#begin', "~/.config/nvim/plugged")
--
-- Plug 'folke/tokyonight.nvim'
-- Plug('tjdevries/colorbuddy.nvim', { ['branch'] = 'dev' })
--
-- Plug('tzachar/cmp-tabnine', { ['do'] = './install.sh' })
-- Plug 'hrsh7th/cmp-nvim-lua'
-- Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug 'hrsh7th/cmp-cmdline'
-- Plug 'saadparwaiz1/cmp_luasnip'
-- Plug 'L3MON4D3/LuaSnip'
-- Plug 'hrsh7th/nvim-cmp'
-- Plug 'golang/vscode-go'
-- Plug 'hrsh7th/vim-vsnip-integ'
--
-- -- Autocompletion framework
-- Plug 'hrsh7th/nvim-cmp'
-- -- cmp LSP completion
-- Plug 'hrsh7th/cmp-nvim-lsp'
-- -- cmp Snippet completion
-- Plug 'hrsh7th/cmp-vsnip'
-- Plug 'hrsh7th/vim-vsnip'
-- -- cmp Path completion
-- Plug 'hrsh7th/cmp-path'
-- Plug 'hrsh7th/cmp-buffer'
-- Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
-- -- See hrsh7th other plugins for more great completion sources!
-- Plug 'rafamadriz/friendly-snippets'
--
-- Plug 'onsails/lspkind-nvim'
--
-- Plug 'ray-x/lsp_signature.nvim'
--
-- Plug 'williamboman/nvim-lsp-installer'
-- Plug 'neovim/nvim-lspconfig'
--
-- Plug 'folke/zen-mode.nvim'
-- Plug 'folke/todo-comments.nvim'
--
-- Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'kyazdani42/nvim-tree.lua'
--
-- Plug 'puremourning/vimspector'
--
-- Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
-- Plug 'nvim-treesitter/nvim-treesitter-textobjects'
--
-- Plug 'moll/vim-bbye'
-- Plug('akinsho/bufferline.nvim', { ['tag'] = 'v3.*' })
--
-- Plug 'nvim-lualine/lualine.nvim'
--
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'nvim-telescope/telescope-symbols.nvim'
-- Plug 'nvim-telescope/telescope.nvim'
-- Plug 'nvim-telescope/telescope-ui-select.nvim'
--
-- Plug 'folke/which-key.nvim'
--
-- Plug 'simrat39/symbols-outline.nvim'
--
-- Plug 'ray-x/go.nvim'
-- Plug 'ray-x/guihua.lua'
--
-- -- Plug 'fatih/vim-go'
-- -- Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
--
-- -- Debug
-- Plug 'mfussenegger/nvim-dap'
-- Plug 'leoluz/nvim-dap-go'
-- Plug 'rcarriga/nvim-dap-ui'
-- Plug 'theHamsta/nvim-dap-virtual-text'
--
-- Plug 'simrat39/rust-tools.nvim'
--
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'antoinemadec/FixCursorHold.nvim'
-- Plug 'nvim-neotest/neotest'
-- Plug 'nvim-neotest/neotest-go'
--
-- Plug 'numToStr/Comment.nvim'
--
-- Plug 'windwp/nvim-autopairs'
--
-- Plug 'voldikss/vim-floaterm'
-- vim.call('plug#end')

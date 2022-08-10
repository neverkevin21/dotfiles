local Plug = vim.fn['plug#']

vim.call('plug#begin', "~/.config/nvim/plugged")

Plug 'folke/tokyonight.nvim'
Plug 'joshdick/onedark.vim'

Plug('tzachar/cmp-tabnine', { ['do'] = './install.sh' })
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'golang/vscode-go'
Plug 'hrsh7th/vim-vsnip-integ'

-- Autocompletion framework
Plug 'hrsh7th/nvim-cmp'
-- cmp LSP completion
Plug 'hrsh7th/cmp-nvim-lsp'
-- cmp Snippet completion
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
-- cmp Path completion
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
-- See hrsh7th other plugins for more great completion sources!
Plug 'rafamadriz/friendly-snippets'

Plug 'onsails/lspkind-nvim'
-- 插入模式函数签名
Plug 'ray-x/lsp_signature.nvim'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'puremourning/vimspector'

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

Plug 'moll/vim-bbye'
Plug 'akinsho/bufferline.nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'folke/which-key.nvim'

Plug 'simrat39/symbols-outline.nvim'

Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'

-- Plug 'fatih/vim-go'
-- Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
-- Debug
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'

Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-go'

Plug 'nvie/vim-flake8'

Plug 'jiangmiao/auto-pairs'

Plug 'voldikss/vim-floaterm'
vim.call('plug#end')

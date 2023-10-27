local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:append(lazypath)

require "plugins"
require "options"
require "keymaps"

require "conf.bufferline"
require "conf.cmp"
-- require "conf.luasnip"
require "conf.dap"
require "conf.go"
require "conf.lsp"
require "conf.lua_ls"
require "conf.lualine"
-- require "conf.neotest"
require "conf.nvim-tree"
require "conf.python"
require "conf.rust"
require "conf.jsonls"
require "conf.telescope"
require "conf.treesitter"
require "conf.tokyonight"
require "conf.which_key"
require "conf.comment"
require "conf.zenmode"
require "conf.todo-comments"


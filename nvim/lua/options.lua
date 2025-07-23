-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {
	nu = true,
	wildmenu = true,
	wrap = false,
	smartindent = true,
	expandtab = true,
	cindent = true,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	splitbelow = true,
	splitright = true,
	showcmd = true,
	updatetime = 300,
	clipboard = "unnamed",
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("au FileType vue setlocal ts=2 sts=2 sw=2 expandtab")
vim.cmd("au FileType js setlocal ts=2 sts=2 sw=2 expandtab")
vim.cmd("au FileType html setlocal ts=2 sts=2 sw=2 expandtab")
vim.cmd("au FileType ts setlocal ts=2 sts=2 sw=2 expandtab")

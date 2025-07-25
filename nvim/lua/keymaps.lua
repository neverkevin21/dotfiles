local opts = { silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local keymap = vim.keymap.set
-- copy to system clipboard
keymap("v", '"+y', ":w !pbcopy<CR>", opts)
keymap("n", '"+p', ":r !pbpaste<CR>", opts)

keymap("n", "<C-s>", ":w<CR>")

-- better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- resize window using <ctrl> arrow keys
keymap("n", "<space><Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<space><Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<space><Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<space><Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- lsp keymaps
keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gk", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
keymap("n", "<space>a", ":lua vim.lsp.buf.code_action()<CR>", opts)

keymap("i", "<C-k>", function()
    vim.lsp.completion.get()
end, opts)

keymap("n", "<leader>v", ":vsp <CR>:lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>s", ":sp <CR>:lua vim.lsp.buf.definition()<CR>", opts)

-- format
keymap("n", "<space>=", ":lua vim.lsp.buf.format( { async = true } )<CR>", opts)
keymap("n", "<leader>=", ":lua require('conform').format({})<CR>", opts)

-- diagnostics
keymap("n", "<space>[", ":lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<space>]", ":lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<space>d", ":lua vim.diagnostic.open_float()<CR>", opts)

-- FTerm
keymap("n", "<Leader>t", ":lua require('FTerm').toggle()<CR>", opts)
keymap("t", "<leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

-- nvim-tree
-- keymap("n", "\\", ":NvimTreeToggle<CR>", opts)

-- replace world under the cursor
keymap("n", "<leader>j", "*``cgn", opts)

-- runner
vim.cmd("au FileType go nnoremap <leader>r :lua require('FTerm').run({'go', 'run', vim.api.nvim_buf_get_name(0)})<CR>")
vim.cmd("au FileType python nnoremap <leader>r :lua require('FTerm').run({'python', vim.api.nvim_buf_get_name(0)})<CR>")
vim.cmd("au FileType rust nnoremap <leader>r :RustRun<CR>")

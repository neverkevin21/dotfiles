local opts = { silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local keymap = vim.api.nvim_set_keymap
-- copy to system clipboard
keymap("v", '"+y', ":w !pbcopy<CR>", opts)
keymap("n", '"+p', ":r !pbpaste<CR>", opts)

-- better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- lsp keymaps
keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gk", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
keymap("n", "<space>a", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>i", ":Telescope lsp_implementations<CR>", opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
keymap("n", "<space>o", ":Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>o", ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)
keymap("n", "<space>=", ":lua vim.lsp.buf.format( { async = true } )<CR>", opts)

keymap("i", "<C-k>", ":lua vim.lsp.buf.completion()<CR>", opts)

keymap("n", "<leader>v", ":vsp <CR>:lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>s", ":sp <CR>:lua vim.lsp.buf.definition()<CR>", opts)

-- diagnostics
keymap("n", "<space>[", ":lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<space>]", ":lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<space>q", ":Telescope diagnostics<CR>", opts)

-- floaterm
keymap("n", "<leader>t", ":FloatermToggle<CR>", opts)

-- nvim-tree
keymap("n", "\\", ":NvimTreeToggle<CR>", opts)

-- BufferLine
keymap("n", "<leader>q", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>e", ":BufferLineCycleNext<CR>", opts)

-- telescope
keymap("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>p", ":Telescope commands<CR>", opts)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<space>t", ":TodoTelescope<CR>", opts)

-- replace world under the cursor
keymap("n", "<leader>j", "*``cgn", opts)

-- copilot
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_no_tab_map = true

keymap("t", "<ESC>", "<C-\\><C-n>", opts)

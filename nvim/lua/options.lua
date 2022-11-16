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
    clipboard = "unnamed"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


vim.cmd "map <S-Tab> <"
vim.cmd "colorscheme tokyonight"

vim.cmd "au FileType go nnoremap <leader>v :vsp <CR>:lua vim.lsp.buf.definition()<CR>"
vim.cmd "au FileType go nnoremap <leader>s :sv <CR>:lua vim.lsp.buf.definition()<CR>"

vim.cmd "au FileType rust nnoremap <leader>v :vsp <CR>:lua vim.lsp.buf.definition()<CR>"
vim.cmd "au FileType rust nnoremap <leader>s :sv <CR>:lua vim.lsp.buf.definition()<CR>"

vim.cmd "au FileType python nnoremap <leader>v :vsp <CR>:lua vim.lsp.buf.definition()<CR>"
vim.cmd "au FileType python nnoremap <leader>s :sv <CR>:lua vim.lsp.buf.definition()<CR>"


vim.cmd "au FileType rust nnoremap <leader>r :RustRun<CR>"
vim.cmd "au FileType go nnoremap <leader>r :GoRun<CR>"

-- run GoFmt on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

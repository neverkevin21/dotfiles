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
vim.cmd "let g:go_highlight_types = 1"
vim.cmd "let g:go_highlight_function_calls = 1"
vim.cmd "let g:go_highlight_operators = 1"
vim.cmd "let g:go_highlight_extra_types = 1"
vim.cmd "let g:go_highlight_function_parameters = 1"
vim.cmd "let g:go_highlight_function_calls = 1"
vim.cmd "let g:go_highlight_fields = 1"

vim.cmd "au FileType go nnoremap <leader>v :vsp <CR>:lua vim.lsp.buf.definition()<CR>"
vim.cmd "au FileType rust nnoremap <leader>v :vsp <CR>:lua vim.lsp.buf.definition()<CR>"
vim.cmd "au FileType python nnoremap <leader>v :vsp <CR>:lua vim.lsp.buf.definition()<CR>"

-- run GoFmt on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

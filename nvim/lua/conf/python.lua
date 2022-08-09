
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach()
    end,
}

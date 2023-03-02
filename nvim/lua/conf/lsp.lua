local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {"jsonls", "html", "yamlls", "taplo"}
for _, ls in ipairs(servers) do
        lspconfig[ls].setup{
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            require "lsp_signature".on_attach()
        end,
    }
end

lsp_installer.setup({
    automatic_installation = true,
    ui = {
        icon = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

require("lsp_signature").setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    },
    floating_window = true,
    toggle_key = "<C-j>",
    hint_enable = false,
    hi_parameter = "LspSignatureActiveParameter"
})

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
        spacing = 4,
        prefix = ''
    }
})

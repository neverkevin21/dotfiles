local lsp_installer = require("nvim-lsp-installer")

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
  }
)

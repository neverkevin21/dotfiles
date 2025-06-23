local mason = require("mason")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


require("mason").setup({
    automatic_installation = true,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp",
        "tsserver",
        "html",
    },
})

local servers = {
    "lua_ls", "html",
}

for _, ls in ipairs(servers) do
    lspconfig[ls].setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            require("lsp_signature").on_attach()
        end,
    })
end

lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach()
    end,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

require("lsp_signature").setup({
    bind = true,
    handler_opts = {
        border = "rounded",
    },
    floating_window = true,
    -- toggle_key = "<C-k>",
    hint_enable = false,
    hi_parameter = "LspSignatureActiveParameter",
})

-- icon
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	underline = true,
-- 	-- This sets the spacing and the prefix, obviously.
-- 	virtual_text = {
-- 		spacing = 4,
-- 		prefix = "",
-- 	},
-- })

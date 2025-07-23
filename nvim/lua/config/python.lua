local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local maxLineLength = 109

-- pip install 'python-lsp-server[all]' python-lsp-black python-lsp-isort
-- :PylspInstall python-lsp-ruff
lspconfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach()
    end,
    settings = {
        pylsp = {
            plugins = {
                -- formatter options
                black = {
                    enabled = true,
                    line_length = maxLineLength,
                    cache_config = true,
                    -- preview = true,
                },
                isort = { enabled = true },
                -- linter options
                ruff = {
                    enabled = true,
                    formatEnabled = true,
                    lineLength = maxLineLength,
                    select = { "I", "S", "E", "W", "F", "B", "SIM", "FAST", "PL", "G", "T20", },
                    format = { "I", "S", "E", "W", "F", "B", "SIM", "FAST", "PL", "G", "T20", },
                    ignore = { "SIM110", "F401", "PLR2004", "SIM103" },
                },
                pylsp_mypy = { enabled = true },
                -- auto-completion options
                jedi_completion = { fuzzy = true },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true, all_scopes = true },
            },
        },
    },
})


local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local maxLineLength = 99;
-- pip install 'python-lsp-server[all]' python-lsp-black python-lsp-isort
lspconfig.pylsp.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach()
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
                yapf = { enabled = false },
                autopep8 = { enabled = false },
                -- import sorting
                isort = { enabled = true },
                -- linter options
                flake8 = {
                    enabled = true,
                    maxLineLength = maxLineLength,
                    ignore = {}
                },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                -- type checker
                pylsp_mypy = { enabled = true },
                -- auto-completion options
                jedi_completion = { fuzzy = true },
                jedi_hover = {enabled = true},
                jedi_references = {enabled = true},
                jedi_signature_help = {enabled = true},
                jedi_symbols = {enabled = true, all_scopes = true},
            },
        }
    }
}


local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

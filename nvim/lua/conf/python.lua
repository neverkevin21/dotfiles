local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- lspconfig.pyright.setup {
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         require "lsp_signature".on_attach()
--     end,
-- }

-- lspconfig.jedi_language_server.setup{
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         require "lsp_signature".on_attach()
--     end,
-- 	init_options = {
-- 		codeAction = {
-- 			nameExtractVariable = 'jls_extract_var',
-- 			nameExtractFunction = 'jls_extract_def',
-- 		},
-- 		completion = {
-- 			disableSnippets = false,
-- 			resolveEagerly = false,
-- 			ignorePatterns = {},
-- 		},
-- 		diagnostics = {
-- 			enable = true,
-- 			didOpen = true,
-- 			didChange = true,
-- 			didSave = true,
-- 		},
-- 		hover = {
-- 			enable = true,
--             disable = {
--                 class = { all = false, names = {}, fullNames = {} },
--                 ["function"] = { all = false, names = {}, fullNames = {} },
--                 instance = { all = false, names = {}, fullNames = {} },
--                 keyword = { all = false, names = {}, fullNames = {} },
--                 module = { all = false, names = {}, fullNames = {} },
--                 param = { all = false, names = {}, fullNames = {} },
--                 path = { all = false, names = {}, fullNames = {} },
--                 property = { all = false, names = {}, fullNames = {} },
--                 statement = { all = false, names = {}, fullNames = {} },
--             },
-- 		},
-- 		jediSettings = {
-- 			autoImportModules = {},
-- 			caseInsensitiveCompletion = true,
-- 			debug = false,
-- 		},
-- 		markupKindPreferred = "markdown",
-- 		workspace = {
-- 			extraPaths = {},
-- 			symbols = {
-- 				ignoreFolders = { ".nox", ".tox", ".venv", "__pycache__", "venv" },
-- 				maxSymbols = 20,
-- 			},
-- 		},
-- 	},
-- }

-- pip install 'python-lsp-server[all]'
lspconfig.pylsp.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach()
    end,
    settings = {
        configurationSources = {"flake8"},
        formatCommand = {"black"},
        pylsp = {
            plugins = {
                black = {
                    enabled = true,
                    cache_config = true,
                    line_length = 99,
                    preview = true,
                },
                pycodestyle = {
                    ignore = {'W391'},
                    maxLineLength = 100
                }
            }
        }
    }
}

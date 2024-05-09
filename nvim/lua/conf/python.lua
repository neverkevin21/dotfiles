local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
lspconfig.pylsp.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach()
    end,
    settings = {
        formatCommand = { "black" },
        pylsp = {
            -- configurationSources = {"flake8"},
            -- plugins = {
            --     black = {
            --         enabled = true,
            --         cache_config = true,
            --         line_length = 150,
            --         preview = true,
            --     },
            --     pycodestyle = {
            --         ignore = {'W391'},
            --         maxLineLength = 150
            --     },
            --     pylsp_mypy = { enabled = true },
            --     jedi_completion = { fuzzy = true },
            --     -- yapf = {
            --     -- }
            -- }
            plugins = {
                -- formatter options
                black = {
                    enabled = true,
                    cache_config = true,
                    line_length = 150,
                    preview = true,
                },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                -- linter options
                pylint = {
                    enabled = false,
                    args = {
                    }
                },
                pyflakes = { enabled = false },
                pycodestyle = {
                    enabled = true,
                    maxLineLength = 300
                },
                -- type checker
                pylsp_mypy = { enabled = true },
                -- auto-completion options
                jedi_completion = { fuzzy = true },
                -- import sorting
                pyls_isort = { enabled = true },
            },
        }
    }
}

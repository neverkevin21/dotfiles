local lspconfig = require('lspconfig')
local util = require("lspconfig/util")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lspconfig.gopls.setup {
    filetype = { "go", "gomod" },
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        require "lsp_signature".on_attach()
    end,
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    setting = {
        gopls = {
            experimentalPostfixCompletions = true,
            experimentalWorkspaceModule = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            env = { GOFLAGS = "-tags=integration" }
        },
    }
}

require('go').setup({
    goimport = "gopls", -- if set to 'gopls' will use gopls format, also goimport
    fillstruct = "gopls",
    -- gofmt = "gopls", -- if set to gopls will use gopls format
    gofmt = "gofumpt",
    max_line_len = 120,
    tag_transform = false,
    test_dir = "",
    comment_placeholder = "   ",
    icons = { breakpoint = "🧘", currentpos = "🏃" }, -- set to false to disable
    -- this option
    verbose = false,
    log_path = vim.fn.expand("$HOME") .. "/tmp/gonvim.log",
    lsp_cfg = false, -- false: do nothing
    -- true: apply non-default gopls setup defined in go/lsp.lua
    -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = nil, -- nil: do nothing
    -- if lsp_on_attach is a function: use this function as on_attach function for gopls,
    -- when lsp_cfg is true
    lsp_keymaps = true,   -- true: apply default lsp keymaps
    lsp_codelens = true,
    lsp_diag_hdlr = true, -- hook lsp diag handler
    lsp_inlay_hints = {
        enable = true,

        -- Only show inlay hints for the current line
        only_current_line = false,

        -- Event which triggers a refersh of the inlay hints.
        -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
        -- not that this may cause higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = "CursorHold",

        -- whether to show variable name before type hints with the inlay hints or not
        -- default: false
        show_variable_name = true,

        -- prefix for parameter hints
        parameter_hints_prefix = " ",
        show_parameter_hints = true,

        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",

        -- whether to align to the lenght of the longest line in the file
        max_len_align = false,

        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,

        -- whether to align to the extreme right or not
        right_align = false,

        -- padding from the right if right_align is true
        right_align_padding = 6,

        -- The color of the hints
        highlight = "Comment",
    },
    gopls_remote_auto = true,
    gocoverage_sign = "█",
    sign_priority = 7,
    dap_debug = true,
    dap_debug_gui = true,
    dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
    -- false: do not use keymap in go/dap.lua.  you must define your own.
    -- windows: use visual studio style of keymap
    dap_vt = true,          -- false, true and 'all frames'
    textobjects = true,
    gopls_cmd = nil,        --- you can provide gopls path and cmd if it not in PATH, e.g. cmd = {  "/home/ray/.local/nvim/data/lspinstall/go/gopls" }
    build_tags = "",        --- you can provide extra build tags for tests or debugger
    test_runner = "go",     -- one of {`go`, `richgo`, `dlv`, `ginkgo`}
    run_in_floaterm = true, -- set to true to run in float window.
    luasnip = false,        -- set true to enable included luasnip
})

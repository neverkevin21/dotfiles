local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspkind = require("lspkind")

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- nvim-snip setup
local cmp = require 'cmp'

cmp.setup {
    snippet = {
        expand = function(args)
            -- luasnip.lsp_expand(args.body)
            vim.fn["vsnip#anonymous"](args.body)
            -- require'luasnip'.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = 'path' },

        -- { name = 'vsnip', priority = 4 },
        -- { name = "nvim_lsp", priority = 3 },
        -- { name = "buffer", priority = 2 },
        -- { name = 'cmdline', priority = 1 },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 60,
            before = function(entry, vim_item)
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end
        })
    },
    view = {
        -- entries = { name = 'custom' }
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
}

-- nvim-autopairs
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = 'path' }
        },
        {
            {
                name = 'cmdline',
                option = {
                    ignore_cmds = { 'Man', '!' }
                }
            }
        })
})

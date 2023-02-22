local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspkind = require("lspkind")
local luasnip = require("luasnip")

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- nvim-snip setup
local cmp = require 'cmp'


cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
            -- vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources {
        { name = 'vsnip', priority = 4 },
        -- { name = 'nvim_lsp_signature_help', priority = 3 },
        { name = "nvim_lsp", priority = 3 },
        { name = "buffer", priority = 2 },
        { name = 'path', priority = 1 },
        -- { name = "nvim_lua", priority = 1 },
        -- { name = 'cmdline' },
        -- { name = 'luasnip', priority = 2 },
        -- { name = 'nvim_lsp' },
        -- { name = 'cmd_tabnine' },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end
        })
    },
    view = {
        entries = { name = 'custom' }
    },
}

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

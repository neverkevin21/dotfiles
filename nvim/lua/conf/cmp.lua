local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspkind = require("lspkind")
local luasnip = require("luasnip")

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
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                -- cmp.select_next_item()
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                end
                cmp.confirm()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ["<S-Tab>"] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        -- { name = 'cmdline' },
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
    }
}

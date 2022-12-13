require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/snippets/" } }

local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d

local postfix = require("luasnip.extras.postfix").postfix


ls.add_snippets(nil, {
    lua = {
        ls.snippet({
            trig = "luasnippet",
            namr = "luasnippet",
            decr = "Lua snippet."
        }, {
            ls.text_node({ 'ls.snippet({' }),
            ls.text_node({ '', '\ttrig = "' }), ls.insert_node(1, 'trigname'), ls.text_node({ '",' }),
            ls.text_node({ '', '\tnamr = "' }), ls.insert_node(2, 'name'), ls.text_node({ '",' }),
            ls.text_node({ '', '\tdecr = "' }), ls.insert_node(3, 'desc'), ls.text_node({ '"' }),
            ls.text_node({ '', '}, {' }),
            ls.text_node({ '', '\t' }), ls.insert_node(4, ''),
            ls.text_node({ '', '})' }),
        })
    },
    go = {
        ls.snippet({
            trig = "pln",
            namr = "fmt.Println",
            decr = "fmt.Println"
        }, {
            ls.text_node({ 'fmt.Println(' }), ls.insert_node(1, ''), ls.text_node({ ")" })
        }),
        postfix(".pln", {
            f(function (_, parent)
                return "fmt.Printf(\"" .. parent.snippet.env.POSTFIX_MATCH ..": %v" .. "\n\")"
            end)
        })
    },
    all = {
        -- postfix Example:
        -- postfix(".br", {
        --     f(function(_, parent)
        --         return "[" .. parent.snippet.env.POSTFIX_MATCH .. "]"
        --     end, {}),
        -- }),
    },
})

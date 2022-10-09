require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/snippets/" } }

local luasnip = require "luasnip"
local funcNode = luasnip.function_node
local postfix = require("luasnip.extras.postfix").postfix

postfix(".br", {
    funcNode(function (_, parent)
        return "[" .. parent.snippet.env.POSTFIX_MATCH .. "]"
    end, {}),
})

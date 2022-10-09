require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/snippets/" } }

local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d
local funcNode = ls.function_node
local postfix = require("luasnip.extras.postfix").postfix

-- TODO: add postfix snippets

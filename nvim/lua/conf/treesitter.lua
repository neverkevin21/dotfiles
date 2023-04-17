require("nvim-treesitter.install").command_extra_args = {
    curl = { "--proxy", "http://127.0.0.1:7890" },
}

require("nvim-treesitter.configs").setup({
    ensure_installed = { "go", "lua", "rust", "python", "yaml", "json", "proto", },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,

        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

    }
    -- textobjects = {
    --     -- syntax-aware textobjects
    --     enable = enable,
    --     lsp_interop = {
    --         enable = enable,
    --     },
    --     keymaps = {
    --         -- or you use the queries from supported languages with textobjects.scm
    --         ["af"] = "@function.outer",
    --         ["if"] = "@function.inner",
    --         ["aC"] = "@class.outer",
    --         ["iC"] = "@class.inner",
    --         ["ac"] = "@conditional.outer",
    --         ["ic"] = "@conditional.inner",
    --         ["ae"] = "@block.outer",
    --         ["ie"] = "@block.inner",
    --         ["al"] = "@loop.outer",
    --         ["il"] = "@loop.inner",
    --         ["is"] = "@statement.inner",
    --         ["as"] = "@statement.outer",
    --         ["ad"] = "@comment.outer",
    --     },
    --     move = {
    --         enable = enable,
    --         set_jumps = true, -- whether to set jumps in the jumplist
    --         goto_next_start = {
    --             ["]m"] = "@function.outer",
    --             ["]]"] = "@class.outer"
    --         },
    --         goto_next_end = {
    --             ["]M"] = "@function.outer",
    --             ["]["] = "@class.outer"
    --         },
    --         goto_previous_start = {
    --             ["[m"] = "@function.outer",
    --             ["[["] = "@class.outer"
    --         },
    --         goto_previous_end = {
    --             ["[M"] = "@function.outer",
    --             ["[]"] = "@class.outer"
    --         }
    --     },
    --     select = {
    --         enable = enable,
    --         keymaps = {
    --             -- You can use the capture groups defined in textobjects.scm
    --             ["af"] = "@function.outer",
    --             ["if"] = "@function.inner",
    --             ["ac"] = "@class.outer",
    --             ["ic"] = "@class.inner",
    --             -- Or you can define your own textobjects like this
    --             ["iF"] = {
    --                 python = "(function_definition) @function",
    --                 cpp = "(function_definition) @function",
    --                 c = "(function_definition) @function",
    --                 java = "(method_declaration) @function",
    --                 go = "(method_declaration) @function"
    --             }
    --         }
    --     },
    --     swap = {
    --         enable = enable,
    --         swap_next = {
    --             ["<leader>a"] = "@parameter.inner"
    --         },
    --         swap_previous = {
    --             ["<leader>A"] = "@parameter.inner"
    --         }
    --     }
    -- }
})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 99

local telescope = require("telescope")

telescope.setup({
    defaults = {
        initial_mode = "insert",
        selection_strategy = "reset",
        -- sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                -- prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.45,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
        },
        path_display = { "smart" },
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {
        "node_modules",
    },
    path_display = { "truncate" },
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    pickers = {
        find_files = {
        }
    },
    extensions_list = { "themes", "terms" },
    extensions = {
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = {   -- extend mappings
                i = {
                    -- ["<C-k>"] = lga_actions.quote_prompt(),
                    -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
            },
            -- ... also accepts theme settings, for example:
            -- theme = "dropdown", -- use dropdown theme
            -- theme = { }, -- use own theme spec
            -- layout_config = { mirror=true }, -- mirror preview pane
        }
    }
})

telescope.load_extension("ui-select")
telescope.load_extension("live_grep_args")

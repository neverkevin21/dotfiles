local telescope = require("telescope")

telescope.setup({
    defaults = {
        initial_mode = "insert",
        mappings = {
        },
    },
    file_ignore_patterns = {
    },
    pickers = {
        find_files = {
        }
    },
    extensions = {
    },
})

telescope.load_extension("ui-select")

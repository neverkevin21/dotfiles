telescope = require'telescope'
telescope.setup({
    defaults = {
        initial_mode = "insert",
        mappings = {
        },
    },
    file_ignore_patterns = {
        "./vendor"
    },
    pickers = {
        find_files = {
        }
    },
    extensions = {
    },
})

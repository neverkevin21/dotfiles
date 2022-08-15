local nvim_tree = require("nvim-tree")

nvim_tree.setup({
    git = {
        enable = false,
    },
    update_cwd = false,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        width = 30,
        side = 'left',
        hide_root_folder = false,
        mappings = {
            custom_only = false,
            list = {
                { key = "s", action = "split" },
                { key = "v", action = "vsplit" },
            },
        },
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = true,
        },
    },
    system_open = {
        cmd = 'open', -- mac 直接设置为 open
    },
})

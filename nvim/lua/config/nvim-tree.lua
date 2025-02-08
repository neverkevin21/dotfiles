local nvim_tree = require("nvim-tree")

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)
    -- remove a default
    -- vim.keymap.del('n', '<C-]>', { buffer = bufnr })

    -- add your mappings
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
end

nvim_tree.setup({
    on_attach = on_attach,
    git = {
        enable = true,
    },
    update_cwd = false,
    update_focused_file = {
        enable = true,
        update_root = false,
        -- update_cwd = false,
    },
    filters = {
        dotfiles = false,
        -- custom = { 'node_modules' },
    },
    view = {
        width = 35,
        side = 'left',
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = false,
        },
    },
    system_open = {
        -- cmd = 'open', -- mac 直接设置为 open
    },
})

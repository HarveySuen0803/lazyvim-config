local Util = require("lazyvim.util")

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    lazy = true,
    keys = {
        {
            "se",
            function()
                require("neo-tree.command").execute({ toggle = false, dir = Util.root() })
            end,
            desc = "Explorer NeoTree (root dir)",
        },
        {
            "sE",
            function()
                require("neo-tree.command").execute({ toggle = false, dir = vim.loop.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
        },
        {
            "sc",
            function()
                require("neo-tree.command").execute({ action = "close" })
            end,
            desc = "Explorer NeoTree (cwd)",
        },
        -- {
        --     "<leader>ge",
        --     function()
        --         require("neo-tree.command").execute({ source = "git_status", toggle = true })
        --     end,
        --     desc = "Git explorer",
        -- },
        -- {
        --     "<leader>be",
        --     function()
        --         require("neo-tree.command").execute({ source = "buffers", toggle = true })
        --     end,
        --     desc = "Buffer explorer",
        -- },
    },
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    init = function()
        if vim.fn.argc(-1) == 1 then
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                require("neo-tree")
            end
        end
    end,
    opts = {
        close_if_last_window = true,
        enable_git_status = false,
        enable_diagnostics = false,
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
        },
        window = {
            mappings = {
                ["z"] = "none",
                ["x"] = "delete",
                ["d"] = "cut_to_clipboard",
                ["o"] = "open",
                ["l"] = "open",
                ["<esc>"] = "cancel", -- close preview or floating neo-tree window
                ["P"] = { "toggle_preview", config = { use_float = true } },
                ["<space>"] = "focus_preview",
                ["S"] = "open_split",
                ["s"] = "open_vsplit",
                ["t"] = "open_tabnew",
                ["h"] = "close_node",
                ["w"] = "open_with_window_picker",
                ["A"] = "add_directory",
                ["D"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["m"] = "move",
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["?"] = "show_help",
                ["<"] = "prev_source",
                [">"] = "next_source",
            },
        },
        default_component_configs = {
            indent = {
                indent_size = 2,
                padding = 1, -- extra padding on left hand side
                -- indent guides
                with_markers = false,
                indent_marker = "│",
                last_indent_marker = "└",
                highlight = "NeoTreeIndentMarker",
                -- expander config, needed for nesting files
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
        },
    },
    config = function(_, opts)
        local function on_move(data)
            Util.lsp.on_rename(data.source, data.destination)
        end

        local events = require("neo-tree.events")
        opts.event_handlers = opts.event_handlers or {}
        vim.list_extend(opts.event_handlers, {
            { event = events.FILE_MOVED, handler = on_move },
            { event = events.FILE_RENAMED, handler = on_move },
        })
        require("neo-tree").setup(opts)
        vim.api.nvim_create_autocmd("TermClose", {
            pattern = "*lazygit",
            callback = function()
                if package.loaded["neo-tree.sources.git_status"] then
                    require("neo-tree.sources.git_status").refresh()
                end
            end,
        })
    end,
}

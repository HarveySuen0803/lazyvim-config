local bg = ""
local fg = ""

return {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
        { "c\\", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
        { "c]", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
        { "c[]", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
        { "<C-S-Tab", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "gT", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "gt", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
    opts = {
        options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            indicator = {
                style = "none",
            },
            themable = true,
            color_icons = true,
            max_name_length = 18,
            max_prefix_length = 18,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
            separator_style = { "", "" },
            buffer_close_icon = "",
        },
        highlights = {
            background = {
                fg = fg,
                bg = bg,
            },
            buffer_selected = {
                bg = bg,
                fg = fg,
                bold = true,
            },
            buffer_visible = {
                bg = bg,
                fg = fg,
            },
            close_button = {
                bg = bg,
            },
            duplicate = {
                bg = bg,
            },
            duplicate_selected = {
                bg = bg,
                fg = fg,
                bold = true,
            },
            duplicate_visible = {
                bg = bg,
            },
            fill = {
                fg = fg,
                bg = bg,
            },
            indicator_visible = {
                bg = bg,
            },
            separator = {
                bg = bg,
                fg = fg,
            },
            separator_visible = {
                bg = bg,
                fg = fg,
            },
            close_button_visible = {
                fg = fg,
                bg = bg,
            },
            modified = {
                fg = fg,
                bg = bg,
            },
            modified_visible = {
                fg = fg,
                bg = bg,
            },
            modified_selected = {
                fg = fg,
                bg = bg,
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd("BufAdd", {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}

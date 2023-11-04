return {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = function()
        return {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
        }
    end,
    main = "ibl",
}

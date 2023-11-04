return {
    {
        "projekt0n/github-nvim-theme",
        config = function()
            require("github-theme").setup({
                styles = {
                    comments = "NONE",
                    functions = "NONE",
                    keywords = "NONE",
                    variables = "NONE",
                    conditionals = "NONE",
                    constants = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                },
                inverse = {
                    match_paren = false,
                    visual = false,
                    search = false,
                },
            })
        end,
    },

    {
        "LazyVim/LazyVim",
        lazy = false,
        opts = {
            colorscheme = "github_light_high_contrast",
        },
    },
}

local function copy(lines, _)
    require("osc52").copy(table.concat(lines, "\n"))
end

local function paste()
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
    name = "osc52",
    copy = { ["+"] = copy, ["*"] = copy },
    paste = { ["+"] = paste, ["*"] = paste },
}

return {
    "ojroques/nvim-osc52",
    lazy = true,
    config = function()
        require("osc52").setup({
            max_length = 0, -- Maximum length of selection (0 for no limit)
            silent = false, -- Disable message on successful copy
            trim = false, -- Trim surrounding whitespaces before copy
        })
    end,
}

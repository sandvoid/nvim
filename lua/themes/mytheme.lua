vim.api.nvim_set_hl(0, "Normal", {
    fg = "#b710e6",
    bg = "#000000",
})

vim.api.nvim_set_hl(0, "Comment", {
    fg = "#6c7086",
    italic = true,
})

vim.api.nvim_set_hl(0, "String", {
    fg = "#a6e3a1",
})

vim.api.nvim_set_hl(0, "Function", {
    fg = "#89b4fa",
})

vim.api.nvim_set_hl(0, "Keyword", {
    fg = "#cba6f7",
})

vim.api.nvim_set_hl(0, "Type", {
    fg = "#f9e2af",
})

vim.api.nvim_set_hl(0, "Constant", {
    fg = "#fab387",
})

vim.api.nvim_set_hl(0, "NvimTreeFolderName", {
    fg = "#4da6ff",
})

vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", {
    fg = "#4da6ff",
})

-- Selected item
vim.api.nvim_set_hl(0, "NvimTreeCursorLine", {
    bg = "#1e3a5f",
})

-- Folder names
vim.api.nvim_set_hl(0, "NvimTreeFolderName", {
    fg = "#4da6ff",
})

-- Open folder names
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", {
    fg = "#4da6ff",
    bold = true,
})

local mytheme = {
    normal = {
        a = { fg = "#ffffff", bg = "#890eab", gui = "bold" },
        b = { fg = "#ffffff", bg = "#242038" },
        c = { fg = "#ffffff", bg = "#16121f" },
    },

    insert = {
        a = { fg = "#ffffff", bg = "#0088cc", gui = "bold" },
        b = { fg = "#ffffff", bg = "#242038" },
        c = { fg = "#ffffff", bg = "#16121f" },
    },

    visual = {
        a = { fg = "#ffffff", bg = "#7a3db8", gui = "bold" },
        b = { fg = "#ffffff", bg = "#242038" },
        c = { fg = "#ffffff", bg = "#16121f" },
    },

    replace = {
        a = { fg = "#ffffff", bg = "#b83232", gui = "bold" },
        b = { fg = "#ffffff", bg = "#242038" },
        c = { fg = "#ffffff", bg = "#16121f" },
    },

    command = {
        a = { fg = "#ffffff", bg = "#c27a00", gui = "bold" },
        b = { fg = "#ffffff", bg = "#242038" },
        c = { fg = "#ffffff", bg = "#16121f" },
    },

    inactive = {
        a = { fg = "#777777", bg = "#16121f" },
        b = { fg = "#777777", bg = "#16121f" },
        c = { fg = "#777777", bg = "#16121f" },
    },
}

return mytheme

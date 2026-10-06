local mytheme = require ("themes.mytheme")
-----------------------------------------------------------
-- Neovim configuration
-----------------------------------------------------------

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------
-- Options
-----------------------------------------------------------

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.splitbelow = true
opt.splitright = true

opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400

-----------------------------------------------------------
-- Bootstrap lazy.nvim
-----------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"

    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim\n", "ErrorMsg" },
            { out, "WarningMsg" },
        }, true, {})

        return
    end
end

vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------

require("lazy").setup({

    -------------------------------------------------------
    -- Colorscheme
    -------------------------------------------------------

    "nvim-lualine/lualine.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    -------------------------------------------------------
    -- Icons
    -------------------------------------------------------

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    -------------------------------------------------------
    -- File explorer
    -------------------------------------------------------

    {
        "nvim-tree/nvim-tree.lua",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()

            -- Disable netrw
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({

                view = {
                    width = 25,
                    side = "left",

                    preserve_window_proportions = true,
                },

                renderer = {

                    indent_markers = {
                        enable = true,
                    },

                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                    },
                },

                filters = {
                    dotfiles = false,
                },

                git = {
                    enable = true,
                },

                actions = {
                    open_file = {
                        quit_on_open = false,
                    },
                },
            })
        end,
    },

    -------------------------------------------------------
    -- Top buffer/tab line
    -------------------------------------------------------

    {
        "akinsho/bufferline.nvim",

        version = "*",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()

            require("bufferline").setup({

                options = {

                    mode = "buffers",

                    numbers = "none",

                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",

                    diagnostics = "nvim_lsp",

                    separator_style = "slant",

                    show_buffer_close_icons = true,
                    show_close_icon = false,

                    always_show_bufferline = true,

                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "Explorer",
                            text_align = "center",
                            separator = true,
                        },
                    },
                },
            })
        end,
    },

    -------------------------------------------------------
    -- Bottom status line
    -------------------------------------------------------

    {
        "nvim-lualine/lualine.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()

            require("lualine").setup({

                options = {
                    theme = mytheme,
                    globalstatus = false,

                    component_separators = {
                        left = "",
                        right = "",
                    },

                    section_separators = {
                        left = "",
                        right = "",
                    },
                },

                sections = {

    lualine_a = {
        {
            "mode",
            color = {
                fg = "#ffffff",
                bg = "#890eab",
                gui = "bold",
            },
            separator = {
                left = "",
                right = "",
            },
            right_padding = 2,
        },
    },

    lualine_b = {
        {
            "filename",
            path = 1,
            color = {
                fg = "#4da6ff",
                bg = "#16121f",
            },
        },
    },

    lualine_c = {},

    lualine_x = {
        {
            "filetype",
            color = {
                fg = "#f9e2af",
                bg = "#16121f",
            },
        },

        {
            "encoding",
            color = {
                fg = "#a6e3a1",
                bg = "#16121f",
            },
        },
    },

    lualine_y = {
        {
            "progress",
            color = {
                fg = "#cba6f7",
                bg = "#16121f",
            },
        },
    },

    lualine_z = {
        {
            "location",
            color = {
                fg = "#ffffff",
                bg = "#0088cc",
                gui = "bold",
            },
            separator = {
                left = "",
                right = "",
            },
            left_padding = 2,
        

                        },
                    },
                },
            })
        end,
    },

})

-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------

local map = vim.keymap.set

-- Save
map("n", "<leader>w", "<cmd>w<CR>", {
    desc = "Save",
})

-- Quit
map("n", "<leader>q", "<cmd>q<CR>", {
    desc = "Quit",
})

-- Save + quit
map("n", "<leader>wq", "<cmd>wq<CR>", {
    desc = "Save and quit",
})

-- File explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer",
})

-- Find current file in explorer
map("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>", {
    desc = "Find file in explorer",
})

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Clear search
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Center cursor
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-----------------------------------------------------------
-- Automatically open file tree
-----------------------------------------------------------

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("NvimTreeOpen")
    end,
})

-----------------------------------------------------------
-- Highlight yanked text
-----------------------------------------------------------

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

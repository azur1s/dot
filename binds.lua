local k = require("which-key")

local tele = require("telescope.builtin")
local mark = require("harpoon.mark")
local mark_ui = require("harpoon.ui")

k.add({
    -- Telescope
    { "<leader>f", tele.find_files, desc = "Find Files" },

    -- Harpoon
    { "<leader>a", mark.add_file, desc = "Add file to harpoon" },
    { "<leader>j", mark_ui.nav_next, desc = "Next file in harpoon" },
    { "<leader>k", mark_ui.nav_prev, desc = "Previous file in harpoon" },
    { "<leader>u", mark_ui.toggle_quick_menu, desc = "Toggle harpoon menu" },

    -- Split
    { "<leader>sv", "<C-w>v", desc = "Split window vertically" },
    { "<leader>sh", "<C-w>s", desc = "Split window horizontally" }, 

    -- Switch focus
    { "<leader>w", "<C-w>w", desc = "Switch focus" },
    { "<leader>W", "<C-w>W", desc = "Switch focus" },

    -- Move line
    { "J", ":m '>+1<CR>gv=gv", mode = "v", desc = "Move line down" },
    { "K", ":m '<-2<CR>gv=gv", mode = "v", desc = "Move line up" },

    -- Redo
    { "U", "<C-r>", mode = "n", desc = "Redo" },
})


-- Neovide settings
if vim.g.neovide then
    vim.o.guifont = "RobotoMono Nerd Font:h16"
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_floating_shadow = false
end

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Sign columns
vim.opt.signcolumn = "yes"

-- Fat cursor
vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- No line wrap
vim.opt.wrap = false

-- Visualize whitespaces
vim.opt.list = true
vim.opt.listchars = {
    tab = ">>",
    trail = "·",
    space = " ",
}

-- 80 columns line
vim.opt.colorcolumn = "80"

-- 4 spaces indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- No line wrap
vim.opt.wrap = false

-- Save undo to files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") or os.getenv("USERPROFILE") .. "/.vimundo"
vim.opt.undofile = true

-- Disable highlight but keep increment search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scroll offset
vim.opt.scrolloff = 8

-- Update time
vim.opt.updatetime = 50

-- Colorscheme
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- Disable italics
local hl_groups = vim.api.nvim_get_hl(0, {})

for key, hl_group in pairs(hl_groups) do
    if hl_group.italic then
        vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, {italic = false}))
    end
end

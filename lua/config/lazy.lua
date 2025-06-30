local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/nvim-cmp" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        { "folke/which-key.nvim", lazy = true,
            opts = {
                preset = "helix",
            },
        },

        { "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {
                defaults = {
                    layout_config = { prompt_position = "top" },
                },
                pickers = { find_files = { find_command = {
                    "rg",
                    "--files", "--hidden", "--glob", "!**/.git/*"
                },
            }, }, },
        },

        { "ThePrimeagen/harpoon" },

        { "nvim-lualine/lualine.nvim",
            opts = {
                options = {
                    icons_enabled = false,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "filetype" },
                    lualine_y = { "" },
                    lualine_z = { "location" },
                },
            },
        },

        { "echasnovski/mini.starter" },

        { "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            opts = {
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<M-m>",
                    },
                },
                filetypes = {
                    lua = true,
                    rust = true,
                    ocaml = true,
                    ["*"] = false,
                },
            },
        },

        { "nyoom-engineering/oxocarbon.nvim" },
        { "andweeb/presence.nvim", opts = {} },
    },
    checker = { enabled = true, notify = false },
})

require("mini.starter").setup()

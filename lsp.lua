-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local k = require("which-key")
        local opts = { buffer = event.buf }

        k.add({
            { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", mode = "n", opts },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", mode = "n", opts, desc = "Go to definition" },
            { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", mode = "n", opts },
            { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", mode = "n", opts },
            { "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", mode = "n", opts },
            { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", mode = "n", opts },
            { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", mode = "n", opts },
            { "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", mode = "n", opts },
            { "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", mode = {"n", "x"}, opts },
            { "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", mode = "n", opts },
        })
    end,
})

local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer", "ocamllsp" },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
})

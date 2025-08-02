return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        { "neovim/nvim-lspconfig", config = function ()
            vim.lsp.enable('jdtls')
        end,
        ft = "java" }
    },
}

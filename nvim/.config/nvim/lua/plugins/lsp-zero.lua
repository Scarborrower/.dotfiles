return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
    },

    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'rust_analyzer'},
            handlers = {
                lsp_zero.default_setup,
            },
        })
        local cmp = require('cmp')
        local cmp_format = require('lsp-zero').cmp_format()
        local cmp_action = require('lsp-zero').cmp_action()


        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),   
            })
        })


    end,
}

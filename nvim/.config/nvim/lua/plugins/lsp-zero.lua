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
    priority = 999,

    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)
        require('mason').setup({})
        require('mason-lspconfig').setup({
            handlers = {
                lsp_zero.default_setup,
            },
        })
        local cmp = require('cmp')
        --        local cmp_format = require('lsp-zero').cmp_format()
        --        local cmp_action = require('lsp-zero').cmp_action()
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        cmp.setup({

            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            ),
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    local luasnip = require('luasnip')
                    local col = vim.fn.col('.') - 1

                    if cmp.visible() then
                        cmp.select_next_item({behavior = 'select'})
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, {'i', 's'}),

                -- Super shift tab
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    local luasnip = require('luasnip')

                    if cmp.visible() then
                        cmp.select_prev_item({behavior = 'select'})
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {'i', 's'}),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            })
        })


    end,
}

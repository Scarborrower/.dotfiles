return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    },
    priority = 999,

    config = function()
        local cmp = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

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

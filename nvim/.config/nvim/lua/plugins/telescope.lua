return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Telescope find files" },
        { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Telescope find buffers" },
    },
}


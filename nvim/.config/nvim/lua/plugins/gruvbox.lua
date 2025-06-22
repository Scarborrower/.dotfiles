return {
    "ellisonleao/gruvbox.nvim", priority = 1000 , 
    opts = {
        transparent_mode = true,
    },
    config = function ()
        vim.cmd.colorscheme "gruvbox"
        vim.o.background = "dark" -- or "light" for light mode
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    end,
}

--[[
return{
    "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
            term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
        })

        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"
    end,
}
--]]

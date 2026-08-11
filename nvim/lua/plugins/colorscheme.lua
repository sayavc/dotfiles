return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            color_overrides = {
                mocha = {
                    base = "#2d2428",
                    mantle = "#271f23",
                    crust = "#1f181c",
                    
                    text = "#f3e5e5",
                    subtext1 = "#d2bfc7",
                    subtext0 = "#b5a3ab",
                    
                    overlay2 = "#8a757e",
                    overlay1 = "#6a5761",
                    overlay0 = "#4a3a42",
                    
                    surface2 = "#42323b",
                    surface1 = "#3d2e36",
                    surface0 = "#33262d",
                    
                    red = "#e55d87",
                    maroon = "#ff7a9f",
                    green = "#8fcfa7",
                    yellow = "#e8af7a",
                    blue = "#8cb2f2",
                    sapphire = "#b4cfff",
                    teal = "#8ecfca", 
                    sky = "#a8ebe5",
                    
                    pink = "#fbcce7",
                    mauve = "#f3a0c3",
                    peach = "#ffd0a3",
                    flamingo = "#e55d87",
                },
            },
            custom_highlights = function(colors)
                return {
                    Visual = { bg = colors.mauve, fg = colors.base },
                    Cursor = { bg = colors.pink, fg = colors.base },
                    CursorLine = { bg = colors.surface0 },
                }
            end,
        })
        
        vim.cmd.colorscheme("catppuccin")
    end,
}


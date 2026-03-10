return {
    "catppuccin/nvim",
    name = "catppuccin",
    prioritity = 1000,
    config = function() 
        vim.cmd("colorscheme catppuccin-mocha") 
    end, 
}

return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" }, 
    config = function()
        require("render-markdown").setup({
            heading = {
                enabled = true,
            },
            code = {
                enabled = true,
                style = "block",
            },
            bullet = {
                enabled = true,
            },
        })
    end,
}

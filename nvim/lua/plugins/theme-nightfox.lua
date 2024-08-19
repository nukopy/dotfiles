return {
    "EdenEast/nightfox.nvim",
    config = function()
        require("nightfox").setup({
            options = {
                transparent = false,
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    type = "italic,bold"
                },
            }
        })
        vim.cmd("colorscheme nordfox")
    end
}

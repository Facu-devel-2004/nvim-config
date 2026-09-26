return {
  {
    "GCBallesteros/jupytext.nvim",
    enabled = true,
    config = function()
      require("jupytext").setup({
        custom_language_formatting = {
          python = {
            extension = "md",
            style = "markdown",
            force_ft = "markdown",
          },
        },
      })
    end,
  },
}

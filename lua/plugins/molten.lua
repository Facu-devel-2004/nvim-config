return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    lazy = false,
    build = ":UpdateRemotePlugins",
    init = function()
      -- Estas configuraciones se ejecutan antes de cargar el plugin
      
      -- Asegurarnos de que Neovim usa el entorno virtual con pynvim instalado
      vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/venv/bin/python3")

      -- Configuraciones básicas de molten
      vim.g.molten_output_win_max_height = 20
      -- Si alguna vez instalas image.nvim con imagemagick y luarocks, descomenta esta linea:
      vim.g.molten_image_provider = "image.nvim"
      
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<CR>", desc = "Molten: Init" },
      { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Molten: Evaluate operator" },
      { "<leader>me", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Molten: Evaluate visual" },
      { "<leader>ml", ":MoltenEvaluateLine<CR>", desc = "Molten: Evaluate line" },
      { "<leader>mc", ":MoltenReevaluateCell<CR>", desc = "Molten: Re-evaluate cell" },
      { "<leader>md", ":MoltenDelete<CR>", desc = "Molten: Delete cell output" },
      { "<leader>mo", ":MoltenShowOutput<CR>", desc = "Molten: Show output" },
      { "<leader>mh", ":MoltenHideOutput<CR>", desc = "Molten: Hide output" },
    },
  },
}

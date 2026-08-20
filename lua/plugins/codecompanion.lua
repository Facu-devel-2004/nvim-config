return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- Para mejor integración visual
    {
      "stevearc/dressing.nvim", -- Mejora las interfaces de selección de Neovim
      opts = {},
    },
  },
  config = function()
    require("codecompanion").setup({
      -- Usaremos Ollama para todas las estrategias (chat y edición en línea)
      strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
        agent = { adapter = "ollama" },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "ollama", -- Nombre interno del adaptador
            schema = {
              model = {
                -- Configurado para usar el modelo más potente según tu preferencia
                default = "qwen3.5:9b",
              },
            },
          })
        end,
      },
    })
  end,
  keys = {
    -- Atajos de teclado para usar CodeCompanion fácilmente
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Abrir Chat (CodeCompanion)" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Menú de Acciones (CodeCompanion)" },
    { "<leader>ce", "<cmd>CodeCompanion<cr>", mode = "v", desc = "Editar código seleccionado (CodeCompanion)" },
  },
}

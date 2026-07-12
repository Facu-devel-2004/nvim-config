-- como este es solo un archivo de especificación de ejemplo, en realidad no carga nada y devuelve un spec vacío
-- stylua: ignore
if true then return {} end

-- cada archivo de spec bajo el directorio "plugins" será cargado automáticamente por lazy.nvim
--
-- En tus archivos de plugins, puedes:
-- * añadir plugins adicionales
-- * deshabilitar/habilitar plugins de LazyVim
-- * sobrescribir la configuración de los plugins de LazyVim
return {
  -- agregar gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configurar LazyVim para que cargue gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- cambiar la configuración de trouble
  {
    "folke/trouble.nvim",
    -- opts se fusionará con el spec padre
    opts = { use_diagnostic_signs = true },
  },

  -- deshabilitar trouble
  { "folke/trouble.nvim", enabled = false },

  -- sobrescribir nvim-cmp y agregar cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- cambiar algunas opciones de telescope y un atajo de teclado para buscar en archivos de plugins
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- agrega un atajo de teclado para explorar los archivos de plugins
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Buscar archivo de plugin",
      },
    },
    -- cambiar algunas opciones
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- agregar pyright a lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright se instalará automáticamente con mason y se cargará con lspconfig
        pyright = {},
      },
    },
  },

  -- agregar tsserver y configurarlo con typescript.nvim en lugar de lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organizar Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Renombrar Archivo", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver se instalará automáticamente con mason y se cargará con lspconfig
        tsserver = {},
      },
      -- puedes realizar cualquier configuración adicional del servidor lsp aquí
      -- devuelve true si no quieres que este servidor se configure con lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- ejemplo de configuración con typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Especifica * para usar esta función como respaldo para cualquier servidor
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- para typescript, LazyVim también incluye specs extras para configurar correctamente lspconfig,
  -- treesitter, mason y typescript.nvim. Así que en lugar de lo anterior, puedes usar:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- agregar más parsers de treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- debido a que `vim.tbl_deep_extend` solo puede fusionar tablas y no listas, el código anterior
  -- sobrescribiría `ensure_installed` con el nuevo valor.
  -- Si prefieres extender la configuración por defecto, usa el código de abajo en su lugar:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- agregar tsx y treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- la función opts también se puede usar para cambiar las opciones por defecto:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },

  -- o puedes devolver nuevas opciones para sobrescribir todas las predeterminadas
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[añade tu configuración personalizada de lualine aquí]]
      }
    end,
  },

  -- usar mini.starter en lugar de alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- agregar los paquetes jsonls y schemastore, y configurar treesitter para json, json5 y jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- agregar cualquier herramienta que quieras tener instalada abajo
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}

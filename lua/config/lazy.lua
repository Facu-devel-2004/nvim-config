-- Define la ruta donde se instalará el gestor de plugins lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Si lazy.nvim no está instalado, lo clona desde su repositorio en GitHub
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  -- Manejo de errores en caso de que falle la clonación
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Error al clonar lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPresiona cualquier tecla para salir..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- Agrega la ruta de lazy.nvim al runtimepath de Neovim para que pueda ser cargado
vim.opt.rtp:prepend(lazypath)

-- Configuración inicial de lazy.nvim
require("lazy").setup({
  spec = {
    -- Agrega LazyVim e importa sus plugins predeterminados
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Importa/sobrescribe con tus propios plugins
    -- Plugins recomendados, typescript, json, copilot
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    -- Importa todos los plugins definidos en la carpeta lua/plugins/
    { import = "plugins" },
  },
  defaults = {
    -- Por defecto, solo los plugins de LazyVim se cargarán de forma "perezosa" (lazy-loading).
    -- Tus plugins personalizados se cargarán al inicio.
    -- Si sabes lo que haces, puedes cambiar esto a `true` para que todos tus plugins se carguen de forma "perezosa" por defecto.
    lazy = false,
    -- Se recomienda dejar version=false por ahora, ya que muchos de los plugins que soportan versiones
    -- tienen lanzamientos desactualizados que podrían romper tu instalación de Neovim.
    version = false, -- usar siempre el último commit de git
    -- version = "*", -- intentar instalar la última versión estable para plugins que soportan semver
  },
  -- Configura los esquemas de color a instalar
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- comprobar automáticamente si hay actualizaciones de los plugins
    notify = false, -- no notificar cuando haya una actualización
  },
  performance = {
    rtp = {
      -- Deshabilita algunos plugins que vienen por defecto (runtimepath) para mejorar el rendimiento
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

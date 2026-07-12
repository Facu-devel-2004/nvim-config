-- Agrega cualquier opción adicional aquí

-- Mostrar el título de la ventana
vim.opt.title = true
-- Auto indentación inteligente
vim.opt.autoindent = true
-- Indentación inteligente para código (basada en llaves, etc.)
vim.opt.smartindent = true
-- Resaltar todas las coincidencias del patrón de búsqueda anterior
vim.opt.hlsearch = true
-- No crear archivos de copia de seguridad (backup)
vim.opt.backup = false
-- Mostrar los comandos que se están tecleando de forma parcial
vim.opt.showcmd = true
-- Usar espacios en lugar de tabulaciones al presionar la tecla Tab
vim.opt.expandtab = true
-- Mantener al menos 10 líneas visibles por encima y por debajo del cursor al hacer scroll
vim.opt.scrolloff = 10
-- Mostrar los resultados de sustitución de comandos en una ventana dividida en tiempo real
vim.opt.inccommand = "split"
-- Ignorar mayúsculas y minúsculas al buscar
vim.opt.ignorecase = true
-- Insertar tabulaciones de forma inteligente
vim.opt.smarttab = true
-- Permitir que las líneas ajustadas continúen indentadas
vim.opt.breakindent = true
-- Número de espacios para cada paso de indentación
vim.opt.shiftwidth = 2
-- Número de espacios que cuenta un <Tab>
vim.opt.tabstop = 2
-- No ajustar el texto visualmente (las líneas largas se salen de la pantalla)
vim.opt.wrap = false
-- Permitir borrar (backspace) sobre el inicio de inserción, saltos de línea e indentación
vim.opt.backspace = { "start", "eol", "indent" }
-- Añadir el directorio actual y todos los subdirectorios a la ruta (para comandos como find)
vim.opt.path:append({ "**" })
-- Ignorar la carpeta node_modules al buscar archivos
vim.opt.wildignore:append({ "*/node_modules/*" })
-- Forzar a que las ventanas divididas horizontalmente aparezcan debajo de la actual
vim.opt.splitbelow = true
-- Forzar a que las ventanas divididas verticalmente aparezcan a la derecha de la actual
vim.opt.splitright = true
-- Mantener la misma línea visual cuando se dividen ventanas
vim.opt.splitkeep = "cursor"

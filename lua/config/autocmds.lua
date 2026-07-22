-- Los Autocmds (comandos automáticos) se cargan automáticamente en el evento VeryLazy
-- Autocmds por defecto que siempre se configuran: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Agrega cualquier autocmd adicional aquí
-- usando `vim.api.nvim_create_autocmd`
--
-- O elimina los autocmds existentes usando su nombre de grupo (que tiene el prefijo `lazyvim_` para los predeterminados)
-- por ejemplo: vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Utilidades UTILES de nvim

--Evita la repeticion de estos eventos se repitan
local function autogroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

--Si hice un pull desde otra terminal, nvim detectara la modificacion de un archivo y la traera
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = autogroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

--Confirmacion visual de copiado de texto
vim.api.nvim_create_autocmd("TextYankPost", {
  group = autogroup("highlight_yank"),
  callback = function()
    if vim.fn.has("nvim-0.13") == 1 then
      vim.hl.hl_op()
    else
      (vim.hl or vim.highlight).on_yank()
    end
  end,
})

--El tamaño cambia con el cambio de la ventana
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = autogroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

--Recuerda donde se quedo el cursor al cerrar y volver a abrir un buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = autogroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

--Los archivos que no se pueden leer ni modificar, al pulsar "q" salimos automáticamente
vim.api.nvim_create_autocmd("FileType", {
  group = autogroup("close_with_q"),
  --Agregar mas si lo deseo
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dap-float",
    "dbout",
    "gitsigns-blame",
    "grub-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

--Mismo que lo anterior pero para archivos .man?
vim.api.nvim_create_autocmd("FileType", {
  group = autogroup("man_unlisted"),
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

--Si el archivo es de texto de lectura, activa el corrector automático
vim.api.nvim_create_autocmd("FileType", {
  group = autogroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

--Muestra un json tal y como es
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = autogroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

--Si creamos una carpeta y archivo al final el cual no existe, este se encargara de crearlos
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = autogroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

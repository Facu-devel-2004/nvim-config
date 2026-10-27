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
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})

--Muestra un json tal y como es
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = autogroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function(event)
    -- No desactivar el conceal para archivos ipynb (para que las imágenes se oculten)
    if not vim.api.nvim_buf_get_name(event.buf):match("%.ipynb$") then
      vim.opt_local.conceallevel = 0
    end
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

-- Solución para archivos Python largos (como Jupytext con Base64)
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  group = autogroup("jupytext_longlines"),
  pattern = { "python", "quarto", "markdown", "json", "jsonc", "*.ipynb" },
  callback = function(event)
    -- Desactivar wrap para que base64 no sature la pantalla (excepto en markdown)
    if vim.bo[event.buf].filetype ~= "markdown" then
      vim.opt_local.wrap = false
    end
    -- Limitar coloreado a 300 columnas para evitar lag
    vim.opt_local.synmaxcol = 300
    
    -- Guardamos el foldexpr original (usualmente el de Treesitter) para no romper los pliegues normales del usuario!
    local old_foldexpr = vim.opt_local.foldexpr:get()
    if old_foldexpr == "" or old_foldexpr == "0" then
      old_foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
    
    _G.JupytextFold = function()
      local lnum = vim.v.lnum
      local line = vim.fn.getline(lnum)
      if string.len(line) > 300 then
        -- Es una línea de imagen base64 gigante
        return ">1"
      end
      -- Si no es imagen, usamos el fold normal para no romper nada
      if old_foldexpr and old_foldexpr ~= "v:lua.JupytextFold()" then
        local ok, res = pcall(vim.api.nvim_eval, old_foldexpr)
        if ok then return res end
      end
      return "0"
    end
    
    _G.JupytextFoldText = function()
      local line = vim.fn.getline(vim.v.foldstart)
      if string.len(line) > 300 then
        return "+--    [Imagen Base64 oculta]"
      end
      return vim.fn.foldtext()
    end
    
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.JupytextFold()"
    vim.opt_local.foldtext = "v:lua.JupytextFoldText()"
    vim.opt_local.foldenable = true
    
    -- Evitar que el pliegue se abra accidentalmente al pasar el cursor
    vim.opt_local.foldopen:remove("hor")
    vim.opt_local.foldopen:remove("search")
    vim.opt_local.foldopen:remove("jump")
    
    -- Forzar el cierre de los pliegues de las imágenes gigantes al abrir el archivo
    -- (Por si tu foldlevel global los mantenía abiertos por defecto)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(event.buf) then return end
      local lines = vim.api.nvim_buf_get_lines(event.buf, 0, -1, false)
      for i, line in ipairs(lines) do
        if string.len(line) > 300 then
          pcall(vim.cmd, tostring(i) .. "foldclose")
        end
      end
    end)
  end,
})

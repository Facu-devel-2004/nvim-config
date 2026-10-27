-- Los atajos de teclado (Keymaps) se cargan automáticamente en el evento VeryLazy
-- Atajos de teclado por defecto que siempre se configuran: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Agrega cualquier atajo de teclado adicional aquí

-- ==========================================
-- ATAJOS PARA ABRIR OLLAMA EN LA TERMINAL
-- ==========================================
-- Estos atajos abren una división vertical, inician el servidor de Ollama en 
-- segundo plano (por si no estaba corriendo) y luego ejecutan el modelo local.

vim.keymap.set("n", "<leader>o1", function()
  -- 1. Abre una nueva ventana dividida verticalmente
  vim.cmd("vsplit")
  -- 2. Ejecuta bash: arranca 'ollama serve' oculto y espera 2 segundos, luego corre tu modelo
  vim.cmd("term bash -c 'ollama serve &> /dev/null & sleep 2; ollama run qwen3.5:4b'")
  -- 3. Entra automáticamente en modo 'Insertar' para que puedas escribir de inmediato
  vim.cmd("startinsert")
end, { desc = "Abrir Ollama (qwen3.5:4b)" })

vim.keymap.set("n", "<leader>o2", function()
  -- 1. Abre una nueva ventana dividida verticalmente
  vim.cmd("vsplit")
  -- 2. Ejecuta bash: arranca 'ollama serve' oculto y espera 2 segundos, luego corre tu modelo
  vim.cmd("term bash -c 'ollama serve &> /dev/null & sleep 2; ollama run qwen3.5:9b'")
  -- 3. Entra automáticamente en modo 'Insertar' para que puedas escribir de inmediato
  vim.cmd("startinsert")
end, { desc = "Abrir Ollama (qwen3.5:9b)" })

-- ==========================================
-- ATAJO PARA ABRIR ANTIGRAVITY (GEMINI)
-- ==========================================
-- Abre una terminal vertical con el asistente Antigravity CLI (agy)
vim.keymap.set("n", "<leader>ag", function()
  vim.cmd("vsplit")
  vim.cmd("term ~/.local/bin/agy")
  vim.cmd("startinsert")
end, { desc = "Abrir Antigravity (Gemini)" })

-- Continuar el chat anterior de Antigravity CLI (agy -c)
vim.keymap.set("n", "<leader>aG", function()
  vim.cmd("vsplit")
  vim.cmd("term ~/.local/bin/agy -c")
  vim.cmd("startinsert")
end, { desc = "Continuar chat anterior Antigravity (agy -c)" })

-- ==========================================
-- MEJORAS PARA LA TERMINAL DE NEOVIM
-- ==========================================
-- Salir del modo insertar de la terminal al modo normal presionando Esc dos veces rápidas
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Salir al modo normal (Terminal)" })

-- ==========================================
-- ATAJOS PARA ABRIR LAZYDOCKER
-- ==========================================
-- Abre lazydocker en una terminal flotante usando la utilidad nativa de LazyVim (Snacks)
vim.keymap.set("n", "<leader>ld", function()
  require("snacks").terminal("lazydocker")
end, { desc = "Lazydocker (Flotante)" })

-- Si prefieres el estilo de división vertical (como tus comandos de Ollama y agy):
vim.keymap.set("n", "<leader>lD", function()
  vim.cmd("vsplit")
  vim.cmd("term lazydocker")
  vim.cmd("startinsert")
end, { desc = "Lazydocker (Vertical)" })

-- ==========================================
-- ATAJOS PARA ABRIR LAZYSQL
-- ==========================================
-- Abre lazysql en una terminal flotante usando la utilidad nativa de LazyVim (Snacks)
vim.keymap.set("n", "<leader>ls", function()
  require("snacks").terminal("lazysql")
end, { desc = "Lazysql (Flotante)" })

-- Si prefieres el estilo de división vertical:
vim.keymap.set("n", "<leader>lS", function()
  vim.cmd("vsplit")
  vim.cmd("term lazysql")
  vim.cmd("startinsert")
end, { desc = "Lazysql (Vertical)" })

-- ==========================================
-- ATAJOS PARA ABRIR LAZYWORKTREE
-- ==========================================
-- Función para abrir lazyworktree:
-- Si seleccionas un worktree con <Enter>, al salir Neovim cambia el directorio (cd) automáticamente al nuevo worktree.
local function open_lazyworktree(opts)
  opts = opts or {}
  local temp_file = vim.fn.tempname()
  local cmd = { "lazyworktree", "--output-selection", temp_file }

  local function on_exit()
    if vim.fn.filereadable(temp_file) == 1 then
      local lines = vim.fn.readfile(temp_file)
      vim.fn.delete(temp_file)
      if #lines > 0 and lines[1] ~= "" then
        local target_dir = vim.trim(lines[1])
        if vim.fn.isdirectory(target_dir) == 1 then
          vim.cmd("cd " .. vim.fn.fnameescape(target_dir))
          vim.notify("Cambiado al worktree: " .. target_dir, vim.log.levels.INFO, { title = "LazyWorktree" })
        end
      end
    end
  end

  if opts.split then
    vim.cmd("vsplit")
    vim.cmd("term " .. table.concat(cmd, " "))
    vim.cmd("startinsert")
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      once = true,
      callback = function()
        on_exit()
      end,
    })
  else
    require("snacks").terminal(cmd, {
      win = {
        on_close = on_exit,
      },
    })
  end
end

-- Abre lazyworktree en terminal flotante (<leader>lw)
vim.keymap.set("n", "<leader>lw", function()
  open_lazyworktree()
end, { desc = "Lazyworktree (Flotante)" })

-- Atajo en grupo Git (<leader>gw)
vim.keymap.set("n", "<leader>gw", function()
  open_lazyworktree()
end, { desc = "Git Worktrees (Lazyworktree)" })

-- Abre lazyworktree en división vertical (<leader>lW)
vim.keymap.set("n", "<leader>lW", function()
  open_lazyworktree({ split = true })
end, { desc = "Lazyworktree (Vertical)" })


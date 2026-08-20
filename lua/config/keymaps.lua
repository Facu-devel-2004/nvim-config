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

-- ==========================================
-- MEJORAS PARA LA TERMINAL DE NEOVIM
-- ==========================================
-- Salir del modo insertar de la terminal al modo normal presionando Esc dos veces rápidas
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Salir al modo normal (Terminal)" })

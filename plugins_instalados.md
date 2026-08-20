# 🔌 Guía de Plugins en Neovim

A continuación, se detalla la lista de plugins instalados en esta configuración, organizados por categoría, junto con sus funciones y comandos más útiles.

---

## 🧭 Navegación y Búsqueda

### `aerial.nvim`
- **Función:** Muestra un esquema estructural del código.
- **Acción Principal:** Visualizar la jerarquía del archivo y saltar rápidamente a una función específica.
- **Comandos:**
  - `<leader>cs`: Abre el esquema del código.

### `flash.nvim`
- **Función:** Motor de salto hiperrápido.
- **Acción Principal:** Resalta palabras a la vista y permite navegar entre ellas en muy pocas pulsaciones.
- **Comandos:**
  - `s` *(Normal)*: Activa flash, escribe la palabra a buscar y la selecciona.
  - `S` *(Normal)*: Igual al anterior pero con bloques de código.

### `harpoon`
- **Función:** Navegador ultrarrápido de archivos frecuentes o anclados.

### `telescope.nvim`
- **Función:** Motor de búsqueda principal, busca archivos, texto dentro de archivos y buffers, filtrado en tiempo real.
- **Comandos:**
  - `:Telescope find_files`: Busca archivos por nombre en el directorio actual.
  - `:Telescope live_grep`: Busca una cadena de texto dentro de todos los archivos del proyecto.
  - `:Telescope buffers`: Muestra los archivos actualmente abiertos.
  - `:Telescope file_browser`: Abre el explorador de archivos.
  - `c` *(Dentro de Telescope)*: Crear archivo.
  - `r` *(Dentro de Telescope)*: Renombrar archivo.
  - `d` *(Dentro de Telescope)*: Eliminar archivo.

### `yanky.nvim`
- **Función:** Mejora del sistema de copiado (yank). Introduce un historial visual al copiar contenido.
- **Comandos:**
  - `:YankyRingHistory`: Abre una ventana para ver y pegar desde el historial.

---

## 🎨 Interfaz de Usuario (UI)

### `bufferline.nvim`
- **Función:** Barra superior estilizada que muestra los buffers (archivos) abiertos.
- **Comandos:**
  - `Shift + h`: Ir al buffer anterior.
  - `Shift + l`: Ir al buffer siguiente.
  - `<leader>bd`: Cerrar el buffer actual.
  - `<leader>bp`: Fijar (pin) el buffer para que no se cierre accidentalmente.

### `lualine.nvim`
- **Función:** Barra de estado informativa y elegante en la parte inferior de la pantalla.

### `mini.icons`
- **Función:** Añade iconos modernos y estéticos a todo el entorno.

### `noice.nvim`
- **Función:** Moderniza la interfaz de Neovim y muestra notificaciones, línea de comandos y mensajes emergentes como ventanas flotantes.

### `nui.nvim`
- **Función:** Librería base que permite crear ventanas flotantes y componentes UI sofisticados.

### `snacks.nvim`
- **Función:** Provee la pantalla principal (dashboard) al abrir Neovim y otras utilidades.
- **Comandos:**
  - `<leader>z`: Modo Zen (limpia la interfaz para centrarse solo en el código).
  - `<leader>n`: Abre el historial de notificaciones.

---

## ⌨️ Edición y Autocompletado

### `blink.cmp`
- **Función:** Motor de autocompletado rápido y eficiente.
- **Comandos:**
  - `Ctrl + n`: Opción siguiente.
  - `Ctrl + p`: Opción anterior.

### `friendly-snippets`
- **Función:** Base de datos masiva de *snippets* (fragmentos de código) para múltiples lenguajes. Trabaja en conjunto con `blink.cmp`.

### `grug-far.nvim`
- **Función:** Herramienta avanzada de búsqueda y reemplazo en todo el proyecto a través de un panel amigable.
- **Comandos:**
  - `<leader>sr`: Abre GrugFar.
  - `<leader>sr` *(Visual)*: Busca y reemplaza el texto previamente seleccionado.

### `mini.ai`
- **Función:** Mejora la edición basada en "Objetos de Texto".
- **Comandos Generales:**
  - `d` (borrar), `c` (cambiar), `y` (copiar), `v` (seleccionar).
- **Comandos Específicos:**
  - `vaf`: Selecciona una función completa visualmente.
  - `cia`: Cambia el argumento de una función directamente.

### `mini.hipatterns`
- **Función:** Resalta patrones de texto. Por ejemplo, colorea códigos hexadecimales directamente con su color.

### `mini.pairs`
- **Función:** Cierre automático de pares (llaves, corchetes, paréntesis, comillas).

### `nvim-ts-autotag`
- **Función:** Cierre y renombrado automático de etiquetas para HTML, XML o JSX.

### `ts-comments.nvim`
- **Función:** Hace que los comentarios sean "inteligentes" en archivos multilingües, adaptando el comentario al lenguaje bajo el cursor.
- **Comandos:**
  - `gcc` *(Normal)*: Comenta la línea actual.
  - `gc` *(Visual)*: Comenta/descomenta el bloque seleccionado.

---

## 🧠 LSP, Sintaxis y Lenguajes

### `mason.nvim`
- **Función:** Gestor de paquetes e instalador gráfico de herramientas externas (servidores LSP, linters, formateadores).
- **Comandos:**
  - `<leader>cm` o `:Mason`: Abre la interfaz para instalar/desinstalar herramientas.

### `nvim-lint`
- **Función:** Usa herramientas externas para evaluar el código en busca de errores de sintaxis y estilo de forma asíncrona.
- **Comandos:**
  - `]d`: Diagnóstico siguiente.
  - `[d`: Diagnóstico anterior.
  - `<leader>cd`: Ver el mensaje completo del error.

### `nvim-treesitter`
- **Función:** Analiza el texto y construye un árbol sintáctico (AST). Mejora drásticamente el resaltado de sintaxis.

### `nvim-treesitter-textobjects`
- **Función:** Extiende Treesitter enseñándole a Neovim dónde inicia y termina una función, clase o condición.

### `todo-comments.nvim`
- **Función:** Analiza el código y resalta visualmente comentarios clave como `TODO`, `BUG`, `HACK` o `NOTE`.
- **Comandos:**
  - `:TodoTelescope`: Abre Telescope mostrando todos los comentarios especiales del proyecto.
  - `:TodoTrouble`: Envía las listas de tareas pendientes al panel de Trouble.

### `trouble.nvim`
- **Función:** Crea un panel estructurado y limpio para listar todos los problemas (diagnósticos, referencias, etc.) del código.
- **Comandos:**
  - `:Trouble diagnostics toggle`: Abre/cierra el panel mostrando errores y advertencias.

### `neogen`
- **Función:** Genera documentación de forma automática según la firma de la función bajo el cursor.
- **Comandos:**
  - `:Neogen` o `<leader>cn`: Genera el bloque de documentación instantáneamente.

---

## 🛠️ Herramientas Específicas de Lenguaje

### C / C++ (`clangd_extensions.nvim`)
- **Función:** Mejora la experiencia de desarrollo en C/C++.
- **Comandos:**
  - `:ClangdSwitchSourceHeader`: Alterna entre cabecera `.h` y origen `.c`/`.cpp`.
  - `:ClangdAST`: Muestra el árbol de sintaxis abstracta.
  - `:ClangdTypeHierarchy`: Muestra la jerarquía de tipos/clases.

### Java (`nvim-jdtls`)
- **Función:** Comprensión profunda de proyectos Java (autocompletado, organización de imports, compilación).
- **Comandos:**
  - `:JdtCompile`: Compila el espacio de trabajo.
  - `:JdtUpdateConfig`: Actualiza la configuración de Gradle/Maven.

### Python (`venv-selector.nvim`)
- **Función:** Selecciona el entorno virtual de Python rápidamente, configurando LSP y DAP en el proceso para evitar errores de módulos.
- **Comandos:**
  - `:VenvSelect` o `<leader>cv`: Abre el menú para elegir el entorno virtual.

### Rust (`rustaceanvim`)
- **Función:** Herramienta definitiva para Rust. Configura `rust-analyzer`, inyecta *inlay hints* y permite depuración fluida.
- **Comandos:**
  - `:RustLsp`: Comando base con múltiples subcomandos.
  - `codeAction`: Sugerencias del compilador.
  - `renderDiagnostic`: Muestra explicaciones detalladas de errores de compilación.

---

## 🧪 Testing, Depuración (DAP) y Construcción

### `cmake-tools.nvim`
- **Función:** Integración directa con proyectos CMake.
- **Comandos:**
  - `:CMakeGenerate`: Genera archivos de construcción.
  - `:CMakeBuild`: Compila el proyecto.
  - `:CMakeRun`: Ejecuta el binario.
  - `:CMakeDebug`: Inicia sesión de depuración.

### `neotest` & `neotest-python`
- **Función:** Ejecución visual de pruebas unitarias sin salir del editor.
- **Comandos:**
  - `<leader>tt` / `tr`: Ejecuta la prueba bajo el cursor.
  - `<leader>tT`: Ejecuta todas las pruebas del archivo.
  - `<leader>ts`: Abre el panel de resumen (árbol de pruebas).
  - `<leader>to`: Abre el panel de salida del fallo.

### `nvim-dap`, `nvim-dap-ui` & `nvim-dap-python`
- **Función:** Transforma Neovim en un IDE con depurador integrado (pausar, inspeccionar variables, avanzar paso a paso).
- **Comandos DAP Básicos:**
  - `<leader>db` / `<leader>dB`: Coloca/quita un punto de interrupción (Breakpoint).
  - `<leader>dc`: Inicia o continúa la ejecución.
  - `<leader>di`: Entrar (*Step Into*).
  - `<leader>do`: Salir (*Step Out*).
- **Comandos UI:**
  - `<leader>du`: Abre/Cierra paneles gráficos (variables, estado, pila).
  - `<leader>de`: Evalúa la expresión bajo el cursor.
- **Comandos Python:**
  - `<leader>dPc`: Depura la clase actual.
  - `<leader>dPt`: Depura el test específico.

---

## 🗄️ Git y Bases de Datos

### `gitsigns.nvim`
- **Función:** Integración visual con Git (archivos modificados marcados en el margen).
- **Comandos:**
  - `]h` / `[h`: Saltar al siguiente/anterior bloque modificado (hunk).
  - `<leader>ghp`: Ventana flotante con los cambios.
  - `<leader>ghs`: Prepara (stage) el bloque actual para el commit.
  - `<leader>ghr`: Deshace (reset) el bloque actual.
  - `<leader>gb`: *Git Blame* de la línea actual.

### `vim-dadbod` & `vim-dadbod-ui`
- **Función:** Conexión y ejecución de consultas a Bases de Datos directamente desde Neovim con interfaz gráfica.
- **Comandos:**
  - `:DB [url]`: Inicia conexión por URL.
  - `:DB {query}`: Ejecuta una consulta rápida.
  - `:DBUI` / `:DBUIToggle`: Abre/Cierra el panel lateral de base de datos.
  - `:DBUIAddConnection`: Agrega una conexión pegando la URL.

---

## ⚙️ Base del Sistema y Utilidades

### `lazy.nvim`
- **Función:** El veloz gestor de paquetes que administra todos estos plugins.
- **Comandos:**
  - `<leader>l`: Abre la interfaz de Lazy para instalar/actualizar.

### `persistence.nvim`
- **Función:** Guarda y restaura sesiones (archivos abiertos, posición, ventanas).
- **Comandos:**
  - `<leader>qs`: Restaura la sesión del directorio actual.
  - `<leader>ql`: Restaura la última sesión en cualquier directorio.
  - `<leader>qd`: Sale sin guardar la sesión actual.

### `which-key.nvim`
- **Función:** Salvavidas para la memoria. Despliega un menú interactivo con los atajos disponibles a medida que los vas tipeando.
- **Comandos:**
  - `:WhichKey`: Muestra el menú.

### `plenary.nvim`
- **Función:** Librería esencial de utilidades en Lua requerida por muchísimos otros plugins.

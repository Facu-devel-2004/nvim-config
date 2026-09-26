
# Plugins Instalados en Nvim


## aerial.nvim
***Funcion: *** Muestra un esquema estructural del codigo.

***Accion Principal: *** Visualizar jerarquia del archivo y saltar a una funcion especifica.

***Comandos: ***
-<leader>cs


## bufferline.nvim
***Funcion: *** Barra superior que muestra los buffers abiertos.

***Comandos: ***
- Shift + h: Buffer anterior.
- Shift + l: Buffer siguiente.
- <leader>bd: Cierro el buffer actual.
- <leader>bp: Fijo el buffer para que no se cierre.


## flash.nvim
***Funcion: *** Motor de salto hiperrapido.

***Accion Principal: *** Resalta palabras a la vista y navegar entre ellas.

***Comandos: ***
- s (Modo Normal): Activa flash, escribe la palabra a buscar y se las seleccionara en el proyecto.
- S (Modo Normal): Lo mismo pero con bloques de codigos.


## lazy.nvim
***Funcion: *** Gestor de paquetes.

***Comandos: ***
- <leader>l: Ventana para la instalacion/actualizacion de paquetes.


## blink.cmp
***Funcion: *** Motor de autocompletado.

***Comandos: ***
- Ctrl + n: Siguiente.
- Ctrl + p: Anterior.


## friendly-snippets
***Funcion: *** Base de datos masiva de snippets para cualquier lenguaje.

***Accion Principal: *** Trabaja con blink, para autocompletar mas codigo.


## gitsigns.nvim
***Funcion: *** Integracion visual y directa con git, archivos marcados.

***Accion Principal: *** Proporciona un contexto visual de los cambios en tiempo real, y permite gestionar el control de versiones sin salir del editor.

***Comandos: ***
- ]h / [h: Saltar al siguiente o anterior bloque de codigo modificado.
- <leader>ghp: Ventana flotante que muestra que cambie.
- <leader>ghs: Preparar unicamente el bloque de codigo en el que estoy posicionado para el proximo commit.
- <leader>ghr: Deshacer los cambios de ese bloque y volver a como estaba en el commit anterior.
- <leader>gb: Activar Git Blame para ver quien escribio la linea en la que estoy posicionado.


## lualine.nvim
***Funcion: *** Barra de estado informativa en la parte inferior.


## mason.nvim
***Funcion: *** Gestor de paquetes para herramientas externas a NeoVim, servidores de lenguaje LSP. mason-lspconfig.nvim es su acople para que esto se inicialice.

***Accion Principal: *** Hace que NeoVim entienda mi codigo.

***Comandos: ***
- <leader>cm o ":Mason": Donde puedo instalar o desinstalar los servidores externos.


## mini.ai
***Funcion: *** Mejora la edicion basada en "Objetos de Texto"

***Comandos: ***
- d: Borrar.
- c: Cambiar.
- y: Copiar.
- v: Seleccionar.
- vaf: Selecciona una funcion completa visualmente.
- cia: Cambia el argumento de una funcion directamente.


## mini.hipatterns
***Funcion: *** Resalta patrones de texto, por ejemplo, el color escrito en CSS.


## mini.icons
***Funcion: *** Añade iconos modernos a mi entorno.


## mini.pairs
***Funcion: *** Cierre automatico de pares, llaves, corchetes y etc.


## noice.nvim
***Funcion: *** Mejora las notificaciones de errores como ventanas flotantes.


## nui.nvim
***Funcion: *** Permite crear ventanas flotantes en el sistema.


## nvim-lint
***Funcion: *** Usa herramientas externas para evaluar el codigo en busca de errores de sintaxis.

***Comandos: ***
- ]d: Diagnostico siguente.
- [d: Diagnostico anterior.
- <leader>cd: Ver mensaje completo.


## nvim-treesitter
***Funcion: *** Analiza el texto y arma un arbol sintactico (AST), sabe diferenciar entre variables.


## nvim-treesitter-textobjects
***Funcion: *** Le enseña a nvim donde inicia y termina una funcion, clase o condicion.


## nvim-ts-autotag
***Funcion: *** Asistente de marcado para cerrar etiquetas de marcado para HTML, XML o JSX.


## persistence.nvim
***Funcion: *** Encargado de recordar que archivos tenia abiertos, en que linea estaba el cursor y que ventanas tenia divididas.

***Conmandos: *** 
- <leader>qs: Restaura la secion guardada para el directorio actual.
- <leader>ql: Restaura la ultima sesion de trabajo, sin importar el directorio.
- <leader>qd: Evita que haga cambios en la sesion actual se guarden al salir.


## plenary.nvim
***Funcion: *** Libreria de utilidades de Lua.


## snacks.nvim
***Funcion: *** Pantalla principal al abrir nvim.

***Comandos: ***
- <leader>z: Modo zen, limpia la interfaz para centrarme solo en el codigo.
- <leader>n: Abre el historial de notificaciones que me haya mostrado el editor.


## telescope.nvim
***Funcion: *** Motor de busqueda principal, busca archivos, texto de archivos y buffers, todo filtrado en tiempo real.

***Comandos: *** 
- ":Telescope find_files": Busca archivos por nombre en mi directorio actual.
- ":Telescope live_grep": Busca una cadena de texto especifica dentro de todos los archivos del proyecto.
- ":Telescope buffers": Muestra los archivos actualmente abiertos.
- ":Telescope file_browser": Abre el explorador de archivos.
- (Dentro de la ventana de telescope, Normal) c: Crear archivo.
- (Dentro de la ventana de telescope, Normal) r: Renombrar archivo.
- (Dentro de la ventana de telescope, Normal) d: Eliminar archivo.


## todo-comments.nvim
***Funcion: *** Analiza el codigo y resalta visualmente comentarios clave como TODO (por hacer), BUG (error), HACK (solucion temporal) o NOTE (nota).

***Comandos: *** 
- ":TodoTelescope": Abre telescope mostrando todos los TODO y comentarios especiales del proyecto.
- ":TodoTrouble": Envia listas de tareas pendientes al panel de trouble.nvim.


## trouble.nvim
***Funcion: *** Crea un panel estructurado para listar todos los problemas de mi codigo de forma limpia.

***Comandos: *** 
- ":Trouble diagnostics toggle": Abre y cierra el panel mostrando errores y advertencias del archivo atual del proyecto.


## ts-comments.nvim
***Funcion: *** Hace que los comentarios sean "inteligentes", por ejemplo si tengo un archivo con multiples lenguajes, este plugin sabe donde esta el cursor y que comentario poner para el lenguaje.

***Comandos: *** 
- (Modo Normal) gcc: Comenta la linea actual.
- (Modo Visual) gc: Seleccionando el texto comenta o descomenta el bloque.


## vim-dadbod
***Funcion: *** Herramienta para interactuar con una base de datos desde neovim. Me permite conectarme, escribir consultas y ejecutarlas sin ir a la terminal.

***Comandos: *** 
- ":DB [url de conexion]": Inicio una conexion.
- ":DB {query}": Ejecuta una consulta rapida.


## which-key.nvim
***Funcion: *** Salvavidas para la memoria, despliega un menu con los comandos displonibles.

***Comandos: ***
- ":WhichKey": Abre el menu desplegable.


## yanky.nvim
***Funcion: *** Mejora del sistema de copiar, ahora hay historial y un visual cuando copias algo.

***Comandos: ***
- ":YankyRingHistory": Abre una ventana para ver el historial.


## clangd_extensions.nvim
***Funcion: *** Mejora la experiencia de desarrollo en C, C++.

***Comandos: ***
- ":ClangdSwitchSourceHeader": Alterna entre el .h, .c / .cpp.
- ":ClangdAST": Muestra el arbol de sintaxis abstracta para la linea actual.
- ":ClangdTypeHierarchy": Muestra la jerarquia de tipos/clases.


## cmake-tools.nvim
***Funcion: *** Integracion directa con cmake.

***Comandos: *** 
- ":CMakeGenerate": Genera los archivos de construccion.
- ":CMakeBuild": Compila el proyecto.
- ":CMakeRun": Ejecuta el binario compilado.
- ":CMakeDebug": Inicia una sesion de depuracion.


## grug-far.nvim
***Funcion: *** Herramienta de busqueda y remplazo, se abre un panel y busco en todo el proyecto el texto a reemplazar.

***Comandos: *** 
- <leader>sr: Abre GrugFar.
- (Modo Visual) <leader>sr: Busca y reemplaza el texto seleccionado.


## harpoon
***Funcion: *** Navegador de archivos abiertos.


## neogen
***Funcion: *** Genera documentacion de forma automatica. Analiza la funcion donde tengo el cursor y genera un esqueleto en el formato correcto para escribir la explicacion.

***Comandos: ***
- ":Neogen": Genera la anotacion en la posicion actual.
- <leader>cn: Genera la documentacion de forma instantanea.


## neotest neotest-python
***Funcion: *** Ejecuta pruebas unitarias sin salir del editor. Muestra visualmente que pruebas pasan y cuales fallan.

***Comandos: *** 
- <leader>tt / tr: Ejecuta la prueba mas cercana a donde tengo el cursor.
- <leader>tT: Ejecuta todas las pruebas del archivo actual.
- <leader>ts: Abre el panel de resumen para ver el arbol de pruebas.
- <leader>to: Abre el panel de salida para leer los detalles del fallo de una prueba.


## nvim-dap
***Funcion: *** Transforma nvim en un IDE completo, permitiendo pausar la ejecucion del codigo, avanzar linea por linea e inspeccionar el valor de las variables en memoria para encontrar errores de logica.

***Comandos: ***
- <leader>db / dB: Coloca o quita un punto de interrupcion en la line actual.
- <leader>dc: Inicia la depuracion o continua la ejecucion hasta el proximo punto de interrupcion.
- <leader>di: Entra dentro de la funcion que se esta llamando en esa linea.
- <lader>do: Sale de la funcion actual y vuelve a donde fue llamada.


## nvim-dap-python
***Funcion: *** Adapta el plugin anterior para python.

***Comandos: *** 
- <leader>dPc: Configurado para ejecutar la clase actual en modo depuracion.
- <leader>dPt: Configurado para ejecutar el test especifico donde tengo el cursor en modo depuracion.


## nvim-dap-ui
***Funcion: *** Le da una interfaz grafica al depurador, abre una ventana y muestra las variables, el estado de la memoria, pila de llamadas y puntos de interrupcion.

***Comandos: *** 
- <leader>du: Abre o cierra todos los paneles de la interfaz.
- <leader>de: Evalua la variable o expresion bajo el cursor.
- (Modo Visual) <leader>de: Lo mismo que el anterior pero el bloque de texto seleccionado.


## nvim-jdtls
***Funcion: *** Le da a nvim la capacidad de entender la estructura completa de un proyecto Java, autocompletar clases, organizar importaciones y compilar.

***Comandos: ***
- ":JdtCompile": Compila el espacio de trabajo.
- ":JdtUpdateConfig": Actualiza la configuracion de Gradle/Maven.


## rustaceanvim
***Funcion: *** Herramienta definitiva para programar en rust. Autoconfigura rust-analyzer (servidor de lenguaje), inyecta inlay hints (pistas visuales de tipos en el codigo) y permite ejecutar test o depurar el codigo.

***Comandos: ***
- ":RustLsp": Comando principal de ahi se derivan a mas funciones.
- "codeAction": Sugerencias de compilador.
- "renderDiagnostic": Para ver explicaciones detalladas de los estrictos errores del compilador de Rust.


## venv-selector.nvim
***Funcion: *** Permite trabajar con entornos virtuales de Python. Permite buscar y seleccionar rapidamente el entorno activo para tu proyecto, al seleccionarlo le avisa al servidor de lenguaje de python y al depurador donde estan instaladas las librerias solucionando los errores de "modulo no encontrado".

***Comandos: *** 
- ":VenvSelect": Menu flotante para buscar y elegir el entorno virtual.
- <leader>cv: Comando anterior para abrir el selector.


## vim-dadbod-ui
***Funcion: *** Este plugin es la interfaz grafica de el que esta relacionado con la Base de Datos.

***Comandos: *** 
- ":DBUI / BDUIToggle": Abre o cierra el panel lateral de la base de datos.
- ":DBUIAddConnection": Abre un prompt para que se agrege una nueva base de datos pegando su URL de conexion.
- ":DBUIFindBuffer": Vincula el archivo de texto SQL en el que estoy trabajando con una base de datos especifica.

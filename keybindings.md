# Neovim — Referencia de atajos de teclado

> Configuración: **nvim** · `<leader>` = `Espacio`

---

## Índice

### Vim fundamentals

- [1.1 Movimiento básico](#11-movimiento-básico)
- [1.2 Búsqueda por carácter en la línea](#12-búsqueda-por-carácter-en-la-línea)
- [1.3 Movimiento por párrafos y pantalla](#13-movimiento-por-párrafos-y-pantalla)
- [1.4 Desplazamiento (scroll)](#14-desplazamiento-scroll)
- [1.5 Marcas](#15-marcas)
- [1.6 Modo insertar](#16-modo-insertar)
- [1.7 Edición (modo normal)](#17-edición-modo-normal)
- [1.8 Copiar y pegar](#18-copiar-y-pegar)
- [1.9 Deshacer y rehacer](#19-deshacer-y-rehacer)
- [1.10 Cambiar mayúsculas / minúsculas](#110-cambiar-mayúsculas--minúsculas)
- [1.11 Unir líneas e indentar](#111-unir-líneas-e-indentar)
- [1.12 Modo visual](#112-modo-visual)
- [1.13 Búsqueda y sustitución](#113-búsqueda-y-sustitución)
- [1.14 Registros y macros](#114-registros-y-macros)
- [1.15 Buffers, ventanas y pestañas](#115-buffers-ventanas-y-pestañas)
- [1.16 Archivos](#116-archivos)
- [1.17 Folds (pliegues)](#117-folds-pliegues)
- [1.18 Diff (comparar archivos)](#118-diff-comparar-archivos)

### Atajos personalizados (nvim)

- [2.1 General](#21-general)
- [2.2 Buffers](#22-buffers)
- [2.3 Diagnósticos](#23-diagnósticos)
- [2.4 LSP](#24-lsp-se-activan-al-conectar-un-servidor)
- [2.5 Formateo (conform.nvim)](#25-formateo-conformnvim)
- [2.6 Snacks — Pickers y explorador](#26-snacks--pickers-y-explorador)
- [2.7 Snacks — Git](#27-snacks--git-leaderg)
- [2.8 Snacks — GitHub](#28-snacks--github-leaderg)
- [2.9 Snacks — Terminal](#29-snacks--terminal-leadert)
- [2.10 Snacks — Scratch](#210-snacks--scratch)
- [2.11 Snacks — Renombrar archivo](#211-snacks--renombrar-archivo)
- [2.12 Toggles de UI](#212-toggles-de-ui-leaderu)
- [2.13 Gitsigns](#213-gitsigns-leaderh)
- [2.14 DAP — Depuración](#214-dap--depuración-leaderd)
- [2.15 mini.surround](#215-minisurround)
- [2.16 mini.ai (text objects extendidos)](#216-miniai-text-objects-extendidos)
- [2.17 Autocompletado (blink.cmp)](#217-autocompletado-blinkcmp)
- [2.18 Copilot — Sugerencias inline](#218-copilot--sugerencias-inline)
- [2.19 CopilotChat — Chat y agente](#219-copilotchat--chat-y-agente)
- [2.20 Which-key](#220-which-key)
- [2.21 Comentarios](#221-comentarios-neovim-nativo)
- [2.22 Typst — Preview y compilación](#222-typst--preview-y-compilación)
- [2.23 Resumen de prefijos `<leader>`](#223-resumen-de-prefijos-leader)

---

## 1 · Vim fundamentals

Atajos nativos de Vim/Neovim que funcionan sin plugins.

### 1.1 Movimiento básico

| Tecla | Acción |
|---|---|
| `h` `j` `k` `l` | Izquierda / Abajo / Arriba / Derecha |
| `w` | Avanzar al inicio de la siguiente palabra |
| `W` | Avanzar al inicio de la siguiente PALABRA (separada por espacios) |
| `b` | Retroceder al inicio de la palabra anterior |
| `B` | Retroceder al inicio de la PALABRA anterior |
| `e` | Avanzar al final de la palabra actual |
| `E` | Avanzar al final de la PALABRA actual |
| `0` | Inicio de la línea |
| `$` | Final de la línea |
| `^` | Primer carácter no blanco de la línea |
| `gg` | Ir a la primera línea del archivo |
| `G` | Ir a la última línea del archivo |
| `{número}G` | Ir a la línea indicada |
| `{número}j` / `{número}k` | Saltar N líneas abajo / arriba |

### 1.2 Búsqueda por carácter en la línea

| Tecla | Acción |
|---|---|
| `f{c}` | Saltar al próximo carácter `c` en la línea |
| `F{c}` | Saltar al carácter `c` anterior en la línea |
| `t{c}` | Saltar un carácter antes de `c` |
| `T{c}` | Saltar un carácter después de `c` (hacia atrás) |
| `;` | Repetir la última búsqueda `f`/`F`/`t`/`T` |
| `,` | Repetir en dirección contraria |

### 1.3 Movimiento por párrafos y pantalla

| Tecla | Acción |
|---|---|
| `{` | Párrafo anterior |
| `}` | Párrafo siguiente |
| `%` | Ir al paréntesis/llave/corchete opuesto |
| `H` | Parte superior de la pantalla |
| `M` | Parte media de la pantalla |
| `L` | Parte inferior de la pantalla |

### 1.4 Desplazamiento (scroll)

| Tecla | Acción |
|---|---|
| `Ctrl-f` | Una página adelante (forward) |
| `Ctrl-b` | Una página atrás (back) |
| `Ctrl-d` | Media página abajo (down) |
| `Ctrl-u` | Media página arriba (up) |
| `z Enter` | Mover la línea actual a la parte superior |
| `zz` | Centrar la línea actual en la pantalla |
| `zb` | Mover la línea actual a la parte inferior |

### 1.5 Marcas

| Tecla | Acción |
|---|---|
| `m{a-z}` | Crear marca local |
| `m{A-Z}` | Crear marca global (accesible entre archivos) |
| `` `{marca} `` | Ir a la posición exacta de la marca |
| `'{marca}` | Ir al inicio de la línea de la marca |
| `:marks` | Listar marcas activas |
| `:delm {marca}` | Eliminar una marca |

### 1.6 Modo insertar

| Tecla | Acción |
|---|---|
| `i` | Insertar antes del cursor |
| `a` | Insertar después del cursor |
| `I` | Insertar al inicio de la línea |
| `A` | Insertar al final de la línea |
| `o` | Nueva línea debajo y entrar en modo insertar |
| `O` | Nueva línea arriba y entrar en modo insertar |
| `R` | Modo reemplazar (sobrescribe caracteres) |

### 1.7 Edición (modo normal)

| Tecla | Acción |
|---|---|
| `x` | Eliminar el carácter bajo el cursor |
| `X` | Eliminar el carácter antes del cursor |
| `dd` | Eliminar la línea actual |
| `D` | Eliminar desde el cursor hasta el final de la línea |
| `d0` | Eliminar desde el cursor hasta el inicio de la línea |
| `dw` | Eliminar hasta el inicio de la siguiente palabra |
| `df{c}` | Eliminar desde el cursor hasta el carácter `c` |
| `diw` | Eliminar la palabra bajo el cursor |
| `di(` | Eliminar el contenido dentro de `()` |
| `di{` | Eliminar el contenido dentro de `{}` |
| `di"` | Eliminar el contenido dentro de `""` |
| `c` | Cambiar (borrar + entrar en modo insertar) |
| `C` | Cambiar desde el cursor hasta el final de la línea |
| `cc` / `S` | Cambiar la línea completa |
| `cw` | Cambiar hasta el final de la palabra |
| `ciw` | Cambiar la palabra completa bajo el cursor |
| `s` | Sustituir el carácter bajo el cursor |
| `c0` | Cambiar desde el cursor hasta el inicio de la línea |
| `c^` | Cambiar desde el cursor hasta el primer carácter no blanco |
| `r{c}` | Reemplazar un carácter sin salir del modo normal |
| `.` | Repetir el último comando |

### 1.8 Copiar y pegar

| Tecla | Acción |
|---|---|
| `yy` | Copiar la línea actual |
| `Y` | Copiar desde el cursor hasta el final de la línea |
| `yw` | Copiar hasta el inicio de la siguiente palabra |
| `yiw` | Copiar la palabra bajo el cursor |
| `p` | Pegar después del cursor |
| `P` | Pegar antes del cursor |

> **Nota:** El portapapeles del sistema está sincronizado (`vim.opt.clipboard = "unnamedplus"`).

### 1.9 Deshacer y rehacer

| Tecla | Acción |
|---|---|
| `u` | Deshacer |
| `Ctrl-r` | Rehacer |
| `U` | Deshacer todos los cambios en la línea actual |

### 1.10 Cambiar mayúsculas / minúsculas

| Tecla | Acción |
|---|---|
| `~` | Alternar mayúscula/minúscula del carácter |
| `g~$` | Alternar desde el cursor hasta el final de la línea |
| `gUw` | Convertir a mayúsculas la palabra |
| `guw` | Convertir a minúsculas la palabra |
| `gUU` | Convertir toda la línea a mayúsculas |
| `guu` | Convertir toda la línea a minúsculas |

### 1.11 Unir líneas e indentar

| Tecla | Acción |
|---|---|
| `J` | Unir la línea actual con la siguiente (con espacio) |
| `gJ` | Unir sin espacio |
| `>>` | Indentar la línea a la derecha |
| `<<` | Indentar la línea a la izquierda |
| `==` | Autoindentar la línea o selección |
| `=G` | Autoindentar desde el cursor hasta el final del archivo |

### 1.12 Modo visual

| Tecla | Acción |
|---|---|
| `v` | Modo visual (selección por caracteres) |
| `V` | Modo visual línea |
| `Ctrl-q` | Modo visual bloque |
| `viw` | Seleccionar la palabra bajo el cursor |
| `gv` | Reseleccionar la última selección |
| `o` | Mover el cursor al otro extremo de la selección |

> En modo visual bloque (`Ctrl-q`), pulsar `I` para insertar texto en todas las líneas seleccionadas.

### 1.13 Búsqueda y sustitución

| Tecla / Comando | Acción |
|---|---|
| `/patrón` | Buscar hacia adelante |
| `?patrón` | Buscar hacia atrás |
| `n` / `N` | Siguiente / anterior coincidencia |
| `*` | Buscar la palabra bajo el cursor (adelante) |
| `#` | Buscar la palabra bajo el cursor (atrás) |
| `:noh` | Limpiar el resaltado de búsqueda |
| `:s/a/b/` | Sustituir la primera ocurrencia en la línea |
| `:s/a/b/g` | Sustituir todas las ocurrencias en la línea |
| `:%s/a/b/g` | Sustituir en todo el archivo |
| `:%s/a/b/gc` | Sustituir en todo el archivo con confirmación |
| `:1,4s/a/b/g` | Sustituir en el rango de líneas 1–4 |

### 1.14 Registros y macros

| Tecla / Comando | Acción |
|---|---|
| `:reg` | Ver todos los registros |
| `"{reg}yy` | Copiar la línea al registro `{reg}` |
| `"{reg}p` | Pegar desde el registro `{reg}` |
| `q{letra}` | Comenzar a grabar macro en el registro `{letra}` |
| `q` | Detener la grabación del macro |
| `@{letra}` | Ejecutar el macro |
| `@@` | Repetir el último macro ejecutado |

### 1.15 Buffers, ventanas y pestañas

| Tecla / Comando | Acción |
|---|---|
| `:ls` | Listar buffers abiertos |
| `:bn` / `:bp` | Buffer siguiente / anterior |
| `:bd` | Cerrar el buffer actual |
| `:%bd` | Cerrar todos los buffers |
| `:wa` | Guardar todos los buffers |
| `:bufdo %s/a/b/g` | Sustituir en todos los buffers abiertos |
| `:sp` / `Ctrl-w s` | Dividir ventana horizontalmente |
| `:vs` / `Ctrl-w v` | Dividir ventana verticalmente |
| `Ctrl-w w` | Siguiente ventana |
| `Ctrl-w h/j/k/l` | Moverse entre ventanas |
| `Ctrl-w +` / `Ctrl-w -` | Aumentar / reducir altura |
| `Ctrl-w >` / `Ctrl-w <` | Aumentar / reducir ancho |
| `Ctrl-w _` | Maximizar altura |
| `Ctrl-w =` | Igualar tamaño de ventanas |
| `:tabnew` | Nueva pestaña |
| `gt` / `gT` | Siguiente / anterior pestaña |
| `:tabclose` | Cerrar pestaña |
| `:tabonly` | Cerrar todas menos la actual |

### 1.16 Archivos

| Tecla / Comando | Acción |
|---|---|
| `:w` | Guardar |
| `:w nombre.ext` | Guardar como |
| `:e nombre.ext` | Abrir archivo |
| `:q` | Cerrar |
| `:wq` / `ZZ` | Guardar y cerrar |
| `:q!` | Cerrar sin guardar |

### 1.17 Folds (pliegues)

| Tecla | Acción |
|---|---|
| `za` | Abrir/cerrar el fold bajo el cursor |
| `zA` | Abrir/cerrar el fold y todos sus anidados |
| `zo` | Abrir fold |
| `zc` | Cerrar fold |
| `zR` | Abrir todos los folds del archivo |
| `zM` | Cerrar todos los folds del archivo |

### 1.18 Diff (comparar archivos)

1. Abrir ambos archivos en splits: `:vsp otro_archivo`
2. Activar diff: `:windo diffthis`
3. Desactivar diff: `:windo diffoff`

| Tecla | Acción |
|---|---|
| `]c` / `[c` | Siguiente / anterior cambio |
| `do` | Obtener cambio del otro lado |
| `dp` | Enviar cambio al otro lado |

---

## 2 · Atajos personalizados (nvim)

Definidos en `lua/config/keymaps.lua` y en los plugins.

### 2.1 General

| Tecla | Modo | Acción | Fuente |
|---|---|---|---|
| `Ctrl-s` | n / i / v | Guardar archivo | keymaps.lua |
| `Esc` | n | Limpiar resaltado de búsqueda | keymaps.lua |
| `Esc Esc` | t | Salir del modo terminal | keymaps.lua |
| `Ctrl-h/j/k/l` | n | Moverse entre ventanas (splits) | keymaps.lua |
| `Alt-h/j/k/l` | i / c / o / t / s / x | Mover cursor (reemplaza flechas) | keymaps.lua |
| Flechas | todos | Deshabilitadas | keymaps.lua |

### 2.2 Buffers

| Tecla | Acción | Fuente |
|---|---|---|
| `]b` | Buffer siguiente | keymaps.lua |
| `[b` | Buffer anterior | keymaps.lua |
| `<leader>bd` | Eliminar buffer | keymaps.lua (snacks) |

### 2.3 Diagnósticos

| Tecla | Acción | Fuente |
|---|---|---|
| `<leader>q` | Abrir lista de diagnósticos (loclist) | keymaps.lua |
| `]d` | Ir al siguiente diagnóstico | keymaps.lua (LSP) |
| `[d` | Ir al diagnóstico anterior | keymaps.lua (LSP) |

### 2.4 LSP (se activan al conectar un servidor)

| Tecla | Acción |
|---|---|
| `gd` | Ir a la definición |
| `gD` | Ir a la declaración |
| `gr` | Ver referencias |
| `gi` | Ir a la implementación |
| `K` | Documentación hover |
| `<leader>ca` | Code action |
| `<leader>cr` | Renombrar símbolo |
| `<leader>cd` | Diagnóstico flotante de la línea |

### 2.5 Formateo (conform.nvim)

| Tecla | Modo | Acción |
|---|---|---|
| `<leader>cf` | n / v | Formatear buffer o selección |

> El formato automático al guardar está habilitado (`format_on_save`).

### 2.6 Snacks — Pickers y explorador

| Tecla | Acción |
|---|---|
| `<leader><space>` | Búsqueda inteligente de archivos |
| `<leader>,` | Buffers |
| `<leader>/` | Grep (buscar en archivos) |
| `<leader>:` | Historial de comandos |
| `<leader>n` | Historial de notificaciones |
| `<leader>e` | Explorador de archivos |

#### Find (`<leader>f`)

| Tecla | Acción |
|---|---|
| `<leader>fb` | Buffers |
| `<leader>fc` | Buscar archivo de configuración |
| `<leader>ff` | Buscar archivos |
| `<leader>fg` | Buscar archivos Git |
| `<leader>fp` | Proyectos |
| `<leader>fr` | Archivos recientes |

### 2.7 Snacks — Git (`<leader>g`)

| Tecla | Acción |
|---|---|
| `<leader>gg` | Lazygit |
| `<leader>gb` | Git branches |
| `<leader>gl` | Git log |
| `<leader>gL` | Git log (línea actual) |
| `<leader>gs` | Git status |
| `<leader>gS` | Git stash |
| `<leader>gf` | Git log (archivo actual) |
| `gB` | Abrir en el navegador (normal + visual) |

### 2.8 Snacks — GitHub (`<leader>g`)

| Tecla | Acción |
|---|---|
| `<leader>gi` | Issues abiertos |
| `<leader>gI` | Todos los issues |
| `<leader>gp` | Pull requests abiertos |
| `<leader>gP` | Todos los pull requests |

Dentro de un buffer de Issue/PR:

| Tecla | Acción |
|---|---|
| `Enter` | Seleccionar acción |
| `i` | Editar |
| `a` | Comentar |
| `c` | Cerrar |
| `o` | Reabrir |

### 2.9 Snacks — Terminal (`<leader>t`)

| Tecla | Acción |
|---|---|
| `<leader>tt` | Terminal (split) |
| `<leader>tT` | Terminal (flotante) |

### 2.10 Snacks — Scratch

| Tecla | Acción |
|---|---|
| `<leader>.` | Abrir/cerrar scratch buffer |
| `<leader>S` | Seleccionar scratch buffer |

### 2.11 Snacks — Renombrar archivo

| Tecla | Acción |
|---|---|
| `<leader>cR` | Renombrar archivo |

### 2.12 Toggles de UI (`<leader>u`)

| Tecla | Acción |
|---|---|
| `<leader>us` | Spell (corrección ortográfica) |
| `<leader>uw` | Wrap (ajuste de línea) |
| `<leader>uL` | Números relativos |
| `<leader>ud` | Diagnósticos |
| `<leader>ul` | Números de línea |
| `<leader>uc` | Conceal |
| `<leader>uT` | Resaltado Treesitter |
| `<leader>ub` | Fondo claro/oscuro |
| `<leader>uh` | Inlay hints |
| `<leader>ug` | Guías de indentación |
| `<leader>uD` | Dim |
| `<leader>uz` | Zen |

### 2.13 Gitsigns (`<leader>h`)

#### Navegación de hunks

| Tecla | Acción |
|---|---|
| `]c` | Siguiente hunk |
| `[c` | Hunk anterior |

#### Acciones

| Tecla | Modo | Acción |
|---|---|---|
| `<leader>hs` | n / v | Stage hunk |
| `<leader>hr` | n / v | Reset hunk |
| `<leader>hS` | n | Stage buffer completo |
| `<leader>hu` | n | Deshacer stage hunk |
| `<leader>hR` | n | Reset buffer completo |
| `<leader>hp` | n | Previsualizar hunk |
| `<leader>hb` | n | Blame de la línea |
| `<leader>hd` | n | Diff contra el índice |
| `<leader>hD` | n | Diff contra el último commit |

#### Toggles

| Tecla | Acción |
|---|---|
| `<leader>tb` | Toggle blame en la línea actual |
| `<leader>tD` | Toggle mostrar líneas eliminadas |

### 2.14 DAP — Depuración (`<leader>d`)

| Tecla | Acción |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Breakpoint condicional |
| `<leader>dc` | Continuar |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Toggle REPL |
| `<leader>dl` | Ejecutar el último |
| `<leader>dt` | Terminar sesión |
| `<leader>du` | Toggle UI de depuración |

### 2.15 mini.surround

| Operación | Teclas | Ejemplo |
|---|---|---|
| Agregar | `sa` + movimiento + delimitador | `saiw"` → `"palabra"` |
| Eliminar | `sd` + delimitador | `sd"` → quitar comillas |
| Reemplazar | `sr` + antiguo + nuevo | `sr"'` → cambiar `"` por `'` |

### 2.16 mini.ai (text objects extendidos)

Usar `i` (inside) / `a` (around) con operadores (`v`, `d`, `c`, `y`):

| Teclas | Acción |
|---|---|
| `vi"` / `va"` | Seleccionar dentro / alrededor de comillas |
| `vi(` / `va(` | Seleccionar dentro / alrededor de paréntesis |
| `vip` / `vap` | Seleccionar dentro / alrededor de párrafo |
| `ci"` | Cambiar dentro de comillas |
| `di(` | Eliminar dentro de paréntesis |

### 2.17 Autocompletado (blink.cmp)

| Tecla | Acción |
|---|---|
| `Ctrl-space` | Abrir menú / abrir documentación |
| `Ctrl-n` / `Ctrl-p` | Siguiente / anterior sugerencia |
| `Ctrl-y` | Aceptar sugerencia |
| `Enter` | Aceptar sugerencia |
| `Ctrl-e` | Cerrar menú |
| `Ctrl-k` | Toggle ayuda de firma (signature) |
| `Tab` / `Shift-Tab` | Moverse dentro del snippet |

### 2.18 Copilot — Sugerencias inline

GitHub Copilot muestra sugerencias "ghost text" mientras escribes en modo insertar.

| Tecla | Modo | Acción |
|---|---|---|
| `Alt-y` | i | Aceptar sugerencia completa |
| `Alt-w` | i | Aceptar la siguiente palabra |
| `Alt-l` | i | Aceptar la siguiente línea |
| `Alt-]` | i | Siguiente sugerencia |
| `Alt-[` | i | Sugerencia anterior |
| `Alt-e` | i | Descartar sugerencia |
| `<leader>aT` | n | Activar/desactivar auto-trigger de sugerencias |

Comandos útiles:

| Comando | Acción |
|---|---|
| `:Copilot auth` | Autenticarse con tu cuenta de GitHub |
| `:Copilot status` | Ver estado de la conexión |
| `:Copilot toggle` | Activar/desactivar sugerencias |

### 2.19 CopilotChat — Chat y agente

Abre un chat con Copilot para preguntar, revisar, generar tests o pedir que edite código.

| Tecla | Modo | Acción |
|---|---|---|
| `<leader>aa` | n / v | Abrir/cerrar ventana de chat |
| `<leader>aq` | n / v | Pregunta rápida (input libre) |
| `<leader>ae` | n / v | Explicar código seleccionado |
| `<leader>ar` | n / v | Revisar código seleccionado |
| `<leader>af` | n / v | Corregir errores en el código |
| `<leader>at` | n / v | Generar tests unitarios |
| `<leader>am` | n | Seleccionar modelo (gpt-4.1, etc.) |
| `<leader>aA` | n | Seleccionar agente |
| `<leader>ax` | n | Resetear conversación |

#### Agente — Condiciones para que funcione en una carpeta

El agente de Copilot puede **leer y editar** archivos de tu proyecto.
Para que funcione correctamente:

1. **Autenticación:** Ejecuta `:Copilot auth` y sigue el flujo de GitHub.
2. **Directorio de trabajo:** Abre Neovim **en la raíz del proyecto**
   (`cd mi-proyecto && nvim`). El `cwd` define el workspace del agente.
3. **Seleccionar agente:** Usa `<leader>aA` (`:CopilotChatAgents`) para ver los
   agentes disponibles y elegir uno con capacidad de edición.
4. **Pedir cambios:** En el chat, describe qué quieres que el agente cambie.
   El agente propondrá diffs que puedes aceptar o rechazar.
5. **Contexto:** Selecciona código en modo visual antes de abrir el chat
   (`<leader>aa`) para dar contexto al agente sobre qué archivos o funciones
   debe modificar.

### 2.20 Which-key

| Tecla | Acción |
|---|---|
| `<leader>` | Mostrar menú de atajos (automático tras 200 ms) |
| `<leader>?` | Mostrar atajos locales del buffer |

### 2.21 Comentarios (Neovim nativo)

| Tecla | Acción |
|---|---|
| `gcc` | Comentar / descomentar línea |
| `gc` | Comentar / descomentar selección (modo visual) |

### 2.22 Typst — Preview y compilación

| Tecla | Modo | Acción |
|---|---|---|
| `<leader>cp` | n | Abrir / cerrar previsualización en el navegador |
| `<leader>co` | n | Abrir el PDF generado en el visor del sistema |
| `<leader>ce` | n | Exportar PDF **ahora mismo** vía tinymist (atajo manual) |

> Atajos disponibles **solo en archivos `.typ`** (definidos en `ftplugin/typst.lua`).

#### Cómo funciona

| Función | Mecanismo |
|---|---|
| **Preview en vivo** | `typst-preview.nvim` abre el navegador con recarga instantánea mientras editas. Requiere `tinymist` instalado (`:MasonInstall tinymist`). |
| **PDF automático al guardar** | El LSP `tinymist` exporta el PDF en la misma carpeta del `.typ` cada vez que guardas (`:w`). Configurado en `lsp/tinymist.lua` con `exportPdf = "onSave"`. |
| **PDF manual** | `<leader>ce` invoca el comando `tinymist.exportPdf` directamente; útil para probar que el servidor está activo y configurado. |

#### Página A4 con bordes visibles en la preview

El tamaño y los bordes de página que se ven en el navegador los controla el
propio documento Typst, **no el plugin de preview**. Si el archivo no declara
`#set page(...)`, Typst usa Letter (EE. UU.) por defecto.

Para obtener una hoja A4 con bordes visibles escribe al principio del `.typ`:

```typst
#set page("a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "es")
#set par(justify: true)
```

**Snippet rápido** — en modo Insert, escribe `a4doc` y pulsa `<Tab>`:
inserta automáticamente el bloque anterior con el cursor en el título.
(El snippet está definido en `snippets/typst.json`.)

#### Cómo generar el PDF (paso a paso)

No es necesario tocar ningún archivo de configuración. El PDF se crea
automáticamente cada vez que guardas el archivo `.typ`:

1. Abre o crea un archivo Typst, por ejemplo:
   ```
   nvim ~/documentos/informe.typ
   ```
2. Escribe o edita el contenido del documento.
3. Guarda con `:w` (o el atajo que tengas para guardar).  
   En ese momento `tinymist` compila el archivo y genera el PDF **en la
   misma carpeta**, con el mismo nombre base:
   ```
   ~/documentos/informe.typ  →  ~/documentos/informe.pdf
   ```
4. El PDF se sobreescribe en cada guardado. Para abrirlo desde Neovim
   pulsa `<leader>co`; eso lo abre en el visor de PDF del sistema.

> **Requisito previo:** `tinymist` debe estar instalado. Si aún no lo
> tienes, ejecuta `:MasonInstall tinymist` dentro de Neovim.

#### El PDF no se genera — diagnóstico

Si después de guardar el PDF no aparece, sigue estos pasos:

1. **Usa `<leader>ce` para generar el PDF directamente:**  
   Este atajo guarda el buffer automáticamente, espera a que tinymist
   compile y solicita la exportación. Si tinymist no está disponible
   intenta con el CLI `typst`. La notificación mostrará el resultado o
   el error exacto. _No necesitas guardar manualmente antes de pulsarlo._

   > Si el buffer nunca tuvo nombre (`:w` nunca fue ejecutado con un
   > nombre de archivo), el atajo lo avisará con un error.

2. **Comprueba que tinymist está corriendo:**  
   `:checkhealth lsp` → debe aparecer `tinymist` con estado `running`.  
   O bien: `:lua print(vim.inspect(vim.lsp.get_clients({ name = "tinymist" })))`.

3. **Consulta el log del LSP:**  
   `:LspLog` abre el log de todos los servidores LSP. Busca líneas con
   `tinymist` y `exportPdf` para ver si hay errores de compilación.  
   Puedes aumentar la verbosidad antes de reiniciar con:
   ```vim
   :lua vim.lsp.set_log_level("debug")
   ```
   Luego abre de nuevo el `.typ`, guarda, y revisa `:LspLog`.

4. **Verifica que tinymist tiene permisos de escritura** en la carpeta
   donde está el archivo `.typ`.

#### URL de la preview

La preview se sirve en `http://127.0.0.1:<puerto>`. El navegador se abre
automáticamente la primera vez. La URL exacta con el número de puerto se
puede ver en las notificaciones de Neovim (`:messages`) en el momento en
que el servidor arranca.

#### Mensaje "Opening another frontend"

Aparece cuando **dos** pestañas del navegador se conectan al mismo servidor
de preview (por ejemplo, si la pestaña anterior seguía abierta y se reconectó
sola al reiniciar). No es un error: ambas pestañas muestran la preview
correctamente. Para evitarlo, **cierra la pestaña del navegador antes de
detener la preview** con `<leader>cp` (`:TypstPreviewToggle`).

#### Comandos alternativos

| Comando | Acción |
|---|---|
| `:TypstPreview` | Abrir preview |
| `:TypstPreviewStop` | Cerrar preview |
| `:TypstPreviewToggle` | Alternar preview |

### 2.23 Resumen de prefijos `<leader>`

| Prefijo | Grupo |
|---|---|
| `<leader>a` | AI (Copilot) |
| `<leader>b` | Buffer |
| `<leader>c` | Code |
| `<leader>d` | Debug (DAP) |
| `<leader>f` | Find |
| `<leader>g` | Git / GitHub |
| `<leader>h` | Git hunk |
| `<leader>t` | Toggle / Terminal |
| `<leader>u` | UI |

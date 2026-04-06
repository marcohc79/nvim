-- Módulo de telemetría LSP.
--
-- Registra eventos del ciclo de vida de los servidores LSP en un fichero de
-- log persistente para diagnosticar congelamientos o cuelgues si vuelven a
-- ocurrir, sin necesidad de reproducir el problema con :LspLog activo.
--
-- Fichero de log:  ~/.local/state/nvim/lsp-diag.log
--                  (abre con :LspDiag o con cualquier editor de texto)
--
-- Comandos:
--   :LspDiag        — abre las últimas entradas del log en un split
--   :LspDiagClear   — vacía el fichero de log
--
-- Neovim 0.11+ requerido (usa LspAttach, LspDetach, LspNotify).

local M = {}

-- ── Ruta del fichero de log ────────────────────────────────────────────────

local LOG_FILE = vim.fn.stdpath("log") .. "/lsp-diag.log"

-- Asegurar que el directorio de log existe (puede no existir en instalaciones
-- nuevas o cuando stdpath("log") es un directorio distinto al de state).
vim.fn.mkdir(vim.fn.fnamemodify(LOG_FILE, ":h"), "p")

-- ── Escritura en log ──────────────────────────────────────────────────────

local function timestamp()
  return os.date("%Y-%m-%dT%H:%M:%S")
end

---Escribe una línea en el fichero de log.
---@param level string  "INFO" | "WARN" | "ERROR"
---@param msg   string  Texto libre del evento.
function M.log(level, msg)
  local line = string.format("[%s] [%-5s] %s\n", timestamp(), level, msg)
  local fh = io.open(LOG_FILE, "a")
  if fh then
    fh:write(line)
    fh:close()
  end
end

-- Grupo de autocomandos único para todo el módulo.
-- Se define antes del primer uso (VimEnter) para que todos los autocmds
-- del módulo compartan el mismo grupo y puedan limpiarse con { clear = true }.
local _lsp_diag_group = vim.api.nvim_create_augroup("LspDiagnostics", { clear = true })

-- ── Marcas de arranque ────────────────────────────────────────────────────
--
-- VimEnter confirma que init.lua terminó sin error.
-- VeryLazy confirma que todos los plugins lazy cargaron.
-- Si el problema ocurre antes de VeryLazy, algún plugin está fallando al
-- cargar; si ocurre después, es un error en tiempo de uso.

vim.api.nvim_create_autocmd("VimEnter", {
  group = _lsp_diag_group,
  once  = true,
  desc  = "Registrar fin de startup",
  callback = function()
    M.log("INFO", "VimEnter — startup complete")
  end,
})

vim.api.nvim_create_autocmd("User", {
  group   = _lsp_diag_group,
  pattern = "VeryLazy",
  once    = true,
  desc    = "Registrar carga completa de plugins + activar captura de errores",
  callback = function()
    M.log("INFO", "VeryLazy — all plugins loaded")

    -- A partir de aquí interceptar vim.notify para guardar en log cualquier
    -- mensaje de nivel WARN o ERROR. Esto captura errores de plugins (which-key,
    -- noice, blink…) que de otro modo solo aparecen en la UI y se pierden.
    -- La intercepción se hace post-VeryLazy para no interferir con noice, que
    -- reemplaza vim.notify durante su carga; al llegar aquí noice ya está
    -- activo y la cadena queda:  noice → nuestro wrapper → original.
    local orig_notify = vim.notify
    vim.notify = function(msg, level, opts)
      if level and level >= vim.log.levels.WARN then
        local lvl = level >= vim.log.levels.ERROR and "ERROR" or "WARN"
        -- Colapsar saltos de línea para que cada evento ocupe una sola línea.
        M.log(lvl, "vim.notify: " .. tostring(msg):gsub("\n", " ↵ "))
      end
      return orig_notify(msg, level, opts)
    end
  end,
})

-- ── Detector de saturación de $/progress ─────────────────────────────────
--
-- La causa raíz del congelamiento histórico era que clangd enviaba ráfagas
-- de notificaciones $/progress durante el indexado, saturando la cola interna
-- de noice.nvim y corrompiendo el estado de todos los floating windows.
--
-- Este detector cuenta mensajes $/progress por servidor en ventanas de 1 s.
-- Si un servidor supera BURST_THRESHOLD mensajes/s, escribe una advertencia
-- en el log para confirmar si el problema está volviendo a ocurrir.

local BURST_THRESHOLD = 15  -- mensajes por segundo que se consideran "burst"
local _progress_counts = {} -- { [server_name] = { count, window_start } }

vim.api.nvim_create_autocmd("LspNotify", {
  group = _lsp_diag_group,
  desc = "Detectar ráfagas de $/progress que saturan noice.nvim",
  callback = function(args)
    if args.data.method ~= "$/progress" then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local name   = client and client.name or ("client#" .. args.data.client_id)
    local now    = os.time()

    local entry = _progress_counts[name]
    if not entry or (now - entry.window_start) >= 1 then
      _progress_counts[name] = { count = 1, window_start = now }
    else
      entry.count = entry.count + 1
      if entry.count == BURST_THRESHOLD then
        M.log("WARN", string.format(
          "$/progress burst: %s envió >=%d msgs/s — posible saturación de noice (revisa lua/plugins/noice.lua)",
          name, BURST_THRESHOLD
        ))
      end
    end
  end,
})

-- ── Ciclo de vida de clientes LSP ─────────────────────────────────────────

vim.api.nvim_create_autocmd("LspAttach", {
  group = _lsp_diag_group,
  desc = "Registrar conexión de servidor LSP",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local name   = client and client.name or ("client#" .. args.data.client_id)
    local file   = vim.api.nvim_buf_get_name(args.buf)
    M.log("INFO", string.format("LspAttach  server=%-20s buf=%-3d file=%s", name, args.buf, file))
  end,
})

vim.api.nvim_create_autocmd("LspDetach", {
  group = _lsp_diag_group,
  desc = "Registrar desconexión de servidor LSP",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local name   = client and client.name or ("client#" .. args.data.client_id)
    local file   = vim.api.nvim_buf_get_name(args.buf)
    M.log("INFO", string.format("LspDetach  server=%-20s buf=%-3d file=%s", name, args.buf, file))
  end,
})

-- ── Comandos de usuario ───────────────────────────────────────────────────

vim.api.nvim_create_user_command("LspDiag", function()
  local lines = vim.fn.filereadable(LOG_FILE) == 1
      and vim.fn.readfile(LOG_FILE)
      or { "(el fichero de log está vacío)" }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].filetype   = "log"
  vim.bo[buf].bufhidden  = "wipe"

  -- Abrir en un split horizontal en la parte inferior, suficientemente alto
  -- para leer varias entradas a la vez sin ocultar el código.
  vim.cmd("botright 20split")
  vim.api.nvim_win_set_buf(0, buf)

  -- Posicionar en la última línea (entrada más reciente).
  vim.api.nvim_win_set_cursor(0, { #lines, 0 })
end, { desc = "Mostrar log de diagnóstico LSP" })

vim.api.nvim_create_user_command("LspDiagClear", function()
  local fh = io.open(LOG_FILE, "w")
  if fh then
    fh:close()
    vim.notify("lsp-diag.log vaciado", vim.log.levels.INFO)
  end
end, { desc = "Vaciar log de diagnóstico LSP" })

-- ── Marca de inicio de sesión ─────────────────────────────────────────────
--
-- Separador visible en el log que permite distinguir sesiones de Neovim.
-- Útil cuando el problema ocurre en una sesión específica (con determinados
-- proyectos o después de N minutos) pero no en otras.

M.log("INFO", string.format(
  "=== sesión iniciada | nvim %s | log: %s ===",
  tostring(vim.version()),
  LOG_FILE
))

return M

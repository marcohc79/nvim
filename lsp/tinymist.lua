-- tinymist: Typst language server
-- https://github.com/Myriad-Dreamin/tinymist
-- Instalar: Mason `:MasonInstall tinymist`
--
-- NOTA: las claves de configuración van en el nivel RAÍZ, sin el wrapper
-- "tinymist" (que es solo una convención de VSCode para sus namespaces).
-- Se entregan por dos vías para garantizar que lleguen:
--   1. init_options  → initializationOptions al arrancar el servidor (más fiable)
--   2. on_attach     → workspace/didChangeConfiguration justo al conectarse
return {
  -- 1. Enviadas en el handshake inicial (initializationOptions)
  init_options = {
    exportPdf = "onSave",
    formatterMode = "typstyle",
  },
  -- 2. Necesario para que workspace/configuration requests funcionen también
  settings = {
    exportPdf = "onSave",
    formatterMode = "typstyle",
  },
  -- 3. Empuje explícito al conectarse: garantiza que el servidor recibe la
  --    configuración incluso si no emitió workspace/configuration durante el
  --    handshake (comportamiento habitual de tinymist) o si se reconectó
  --    a un proceso ya en marcha.
  on_attach = function(client)
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
}

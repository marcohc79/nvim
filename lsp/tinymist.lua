-- tinymist: Typst language server
-- https://github.com/Myriad-Dreamin/tinymist
-- Instalar: Mason `:MasonInstall tinymist`
--
-- NOTA: las claves de configuración van en el nivel RAÍZ, sin el wrapper
-- "tinymist" (que es solo una convención de VSCode para sus namespaces).
--
-- La configuración llega al servidor por dos vías:
--   · init_options → initializationOptions durante el handshake (más fiable)
--   · on_attach    → workspace/didChangeConfiguration al conectarse,
--                    como seguro ante reconexiones o servidores ya en marcha
--
-- La tabla `settings` es el almacén de datos que Neovim entrega si el servidor
-- hace un pull con workspace/configuration; no es una tercera entrega activa.
return {
  init_options = {
    exportPdf = "onSave",
    formatterMode = "typstyle",
  },
  settings = {
    exportPdf = "onSave",
    formatterMode = "typstyle",
  },
  on_attach = function(client)
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
}

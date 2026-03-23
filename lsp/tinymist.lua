-- tinymist: Typst language server
-- https://github.com/Myriad-Dreamin/tinymist
-- Instalar: Mason `:MasonInstall tinymist`
return {
  settings = {
    tinymist = {
      exportPdf = "onSave",
      formatterMode = "typstyle",
    },
  },
  -- tinymist no solicita workspace/configuration al arrancar, por lo que hay
  -- que empujar la configuración explícitamente para que exportPdf surta efecto.
  on_attach = function(client)
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
}

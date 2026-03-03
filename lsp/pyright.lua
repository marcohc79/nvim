-- pyright: Python
-- https://github.com/microsoft/pyright
-- Instalar: npm i -g pyright
return {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic",
      },
    },
  },
}

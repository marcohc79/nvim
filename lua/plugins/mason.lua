-- Mason se usa SOLO como herramienta manual para instalar servidores LSP.
-- No se usa ensure_installed; el usuario instala lo que necesite con :Mason.
-- Los servidores LSP se habilitan en init.lua con vim.lsp.enable().
return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
}

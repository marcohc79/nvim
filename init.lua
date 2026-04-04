require("config.lazy")
require("config.keymaps")
require("config.options")

-- Habilitar todos los servidores LSP definidos en lsp/*.lua.
-- Neovim 0.11+ solo arranca cada servidor si su binario está en el PATH.
-- Para instalar un servidor ver INSTALL.md o el comentario en cada lsp/*.lua.
local servers = {}
for _, path in ipairs(vim.fn.glob(vim.fn.stdpath("config") .. "/lsp/*.lua", false, true)) do
  servers[#servers + 1] = vim.fn.fnamemodify(path, ":t:r")
end
vim.lsp.enable(servers)

-- Telemetría LSP: registra attach/detach, crashes de clangd y bursts de
-- $/progress para diagnosticar congelamientos si vuelven a reproducirse.
-- Log: ~/.local/state/nvim/lsp-diag.log  |  Ver con :LspDiag
require("config.lsp-diagnostics")

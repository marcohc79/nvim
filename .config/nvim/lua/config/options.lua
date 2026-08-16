-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.breakindent = true
opt.expandtab = false
opt.inccommand = "split"
opt.scrolloff = 8
opt.smartindent = true
opt.spelllang = { "en", "es" }
opt.textwidth = 120
opt.winborder = "rounded"

-- Fuerza que los archivos .h sean tratados como C y no como C++
vim.filetype.add({
  extension = {
    h = "c",
  },
})

-- Configuración de Molten
local function find_venv_python()
  local cwd = vim.fn.getcwd()
  local venv_python = cwd .. "/.venv/bin/python"
  if vim.fn.executable(venv_python) == 1 then
    return venv_python
  end
  return vim.fn.exepath("python3") -- fallback al Python de sistema
end

vim.g.python3_host_prog = find_venv_python()

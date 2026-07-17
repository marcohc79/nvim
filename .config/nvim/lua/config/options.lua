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

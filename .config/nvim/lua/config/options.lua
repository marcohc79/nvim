-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.smartindent = true
vim.opt.spelllang = { "en", "es" }
vim.opt.textwidth = 120
vim.opt.wrap = true

-- Fuerza que los archivos .h sean tratados como C y no como C++
vim.filetype.add({
  extension = {
    h = "c",
  },
})

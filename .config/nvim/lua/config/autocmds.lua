-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
---
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
---
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- C / headers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.bo.expandtab = false
    vim.bo.tabstop = 8
    vim.bo.shiftwidth = 8
    vim.bo.softtabstop = 8
  end,
})

-- Open PDF files with Zathura
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "*.pdf",
  callback = function(ev)
    local buf = ev.buf
    vim.fn.jobstart({ "zathura", ev.file }, { detach = true, stdin = "null" })
    vim.schedule(function()
      vim.cmd("bprevious")
      vim.api.nvim_buf_delete(buf, { force = true })
    end)
  end,
})

-- Set SpellBad and SpellCap highlight groups with undercurl and custom colors
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#eb6f92" })
    vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "#f6c177" })
  end,
})

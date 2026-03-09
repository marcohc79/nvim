-- Copilot: activar/desactivar sugerencias automaticas con <leader>uc
vim.keymap.set("n", "<leader>uc", function()
  local suggestion = require("copilot.suggestion")
  -- nil significa que usa el valor del config (auto_trigger = false)
  local current = vim.b.copilot_suggestion_auto_trigger
  if current == nil then current = false end
  suggestion.toggle_auto_trigger()
  vim.notify("Copilot auto-trigger: " .. (not current and "ON" or "OFF"), vim.log.levels.INFO)
end, { desc = "Toggle Copilot auto-trigger" })

-- LSP keymaps (solo se activan cuando un servidor LSP se conecta al buffer)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to definition" }))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "LSP: Go to declaration" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP: References" }))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP: Go to implementation" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP: Hover documentation" }))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code action" }))
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename symbol" }))
    vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "LSP: Line diagnostics" }))
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
    -- Inlay hints desactivados por defecto; activar/desactivar con <leader>uh
    vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
  end,
})

-- Bufferline: cycle
vim.keymap.set("n", "]b", "<cmd>bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bp<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<leader>bd", function() require("snacks").bufdelete() end, { desc = "Delete buffer" })
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- Disable arrow keys in all modes
-- local modes = { 'n', 'i', 'v', 'c', 't', 'o', 's', 'x' } -- All possible modes
local modes = { 'n', 'i', 'v', 'o', 't', 's', 'x' } -- All possible modes
local arrows = { '<Up>', '<Down>', '<Left>', '<Right>' }

for _, mode in ipairs(modes) do
  for _, key in ipairs(arrows) do
    vim.keymap.set(mode, key, '<Nop>', { noremap = true, silent = true })
  end
end

local enabledModes = { 'i', 'c', 'o', 't', 's', 'x' }
-- Map Alt + hjkl in Insert mode
for _, mode in ipairs(enabledModes) do
  vim.keymap.set(mode, '<A-h>', '<Left>', { noremap = true, silent = true })
  vim.keymap.set(mode, '<A-j>', '<Down>', { noremap = true, silent = true })
  vim.keymap.set(mode, '<A-k>', '<Up>', { noremap = true, silent = true })
  vim.keymap.set(mode, '<A-l>', '<Right>', { noremap = true, silent = true })
end

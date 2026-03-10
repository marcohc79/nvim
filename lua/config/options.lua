-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Disable unused providers (removes checkhealth warnings)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Register filetypes used by LSP servers (gopls, lemminx, yamlls)
vim.filetype.add({
  extension = {
    gowork = "gowork",
    gotmpl = "gotmpl",
    xsl = "xsl",
  },
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    [".gitlab-ci.yml"] = "yaml.gitlab",
  },
  pattern = {
    ["docker%-compose%..*%.ya?ml"] = "yaml.docker-compose",
    ["%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
    ["values%.ya?ml"] = "yaml.helm-values",
  },
})

-- [[ Setting options ]]
-- See `:help vim.opt`

-- Make line numbers default
vim.opt.number = true
-- Relative line numbers, to help with jumping.
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Mapped sequence wait time.
-- Increase to give which-key enough time to show the popup (delay = 200ms)
-- before the sequence times out. 300ms is too tight → popup appears and
-- disappears before you can read it, or doesn't appear at all under load.
vim.opt.timeoutlen = 500

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Use Spaces instead of tabs
vim.opt.expandtab = true
-- size for spaces using << and >>
vim.opt.shiftwidth = 4
-- size for spaces for tab
vim.opt.tabstop = 4
-- how many spaces when pressing tab
vim.opt.softtabstop = 4

-- indentation options
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Enable 24-bit (true color) support in the terminal
vim.opt.termguicolors = true

-- 
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

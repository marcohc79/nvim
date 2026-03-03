-- texlab: LaTeX
-- https://github.com/latex-lsp/texlab
-- Instalar: Mason `:MasonInstall texlab` o cargo install texlab
return {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = false,
      },
    },
  },
}

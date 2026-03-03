-- gopls: Go
-- https://github.com/golang/tools/tree/master/gopls
-- Instalar: sudo dnf install golang && go install golang.org/x/tools/gopls@latest
return {
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}

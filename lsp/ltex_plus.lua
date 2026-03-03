-- ltex_plus: gramática y ortografía para LaTeX, Markdown, texto plano
-- https://github.com/ltex-plus/ltex-ls-plus
-- Instalar: :MasonInstall ltex-ls-plus (ya instalado)
-- Idiomas: inglés y español activados por defecto.
return {
  settings = {
    ltex = {
      language = "auto",
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "es",
      },
    },
  },
}

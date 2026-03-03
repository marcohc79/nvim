-- yamlls: YAML
-- https://github.com/redhat-developer/yaml-language-server
-- Instalar: npm i -g yaml-language-server
return {
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      format = { enable = true },
      validate = true,
      schemaStore = { enable = true, url = "https://www.schemastore.org/api/json/catalog.json" },
    },
  },
}

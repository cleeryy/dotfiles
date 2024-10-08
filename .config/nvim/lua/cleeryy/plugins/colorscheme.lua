return {
  "talha-akram/noctis.nvim",
  name = "noctis",
  priority = 1000,
  config = function()
    -- Configuration de Flexoki
    vim.g.flexoki_variant = "Azureus" -- ou "light" si vous préférez la version claire
    vim.g.flexoki_enable_italics = true -- activez ou désactivez les italiques selon vos préférences

    -- Appliquer le thème
    vim.cmd("colorscheme noctis_azureus")
  end,
}

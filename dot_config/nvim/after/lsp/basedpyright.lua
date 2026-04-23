-- Override nvim-lspconfig defaults for basedpyright
return {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'basic', -- Options: 'off', 'basic', 'standard', 'strict'
      },
      -- Disable organize imports in favor of Ruff
      disableOrganizeImports = true,
    },
  },
}

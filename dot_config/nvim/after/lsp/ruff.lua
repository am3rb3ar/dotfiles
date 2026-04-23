-- Override nvim-lspconfig defaults for Ruff
return {
  init_options = {
    settings = {
      logLevel = 'error',
    }
  },
  -- Disable hover in favor of basedpyright/ty
  on_attach = function(client, _)
    client.server_capabilities.hoverProvider = false
  end,
}

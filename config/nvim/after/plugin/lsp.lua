local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
  'clangd',
  'cssls',
  'arduino_language_server',
  'bashls',
  'dockerls',
  'jsonls',
  'ltex',
  'remark_ls',
  'opencl_ls',
  'sqlls',
  'tailwindcss',
  'lua_ls'
})

lsp.setup()

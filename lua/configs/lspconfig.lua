
local lspconfig = require "lspconfig"
local blink_cmp = require("blink.cmp")
local servers = { "gopls", "rust_analyzer", "tinymist", "pylsp" }

local capabilities = blink_cmp.get_lsp_capabilities {}
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities
  }
end

lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = { "clangd", "-header-insertion=never" },
}

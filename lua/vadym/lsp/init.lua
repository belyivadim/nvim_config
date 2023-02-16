local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end


status_ok, _ = pcall(require, "vadym.lsp.mason")
--require("vadym.lsp.lsp-installer")
local handlers
status_ok, handlers = pcall(require, "vadym.lsp.handlers")
if not status_ok then
    return
end
handlers.setup()


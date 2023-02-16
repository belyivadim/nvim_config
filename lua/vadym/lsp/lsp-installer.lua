local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("vadym.lsp.handlers").on_attach,
        capabilities = require("vadym.lsp.handlers").capabilities,
    }

    if server.name == "lua_ls" then
        local server_opts = require("user.lsp.settings.lua_ls")
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    server:setup(opts)
end)

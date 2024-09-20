local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
  },
  on_attach=function (client, buffer)
    if client.supports_method("textDocument/Formatting") then
      vim.api.nvim_clear_autocmds({
        group=augroup,
        buffer=buffer,
      })
      vim.api.nvim_create_autocmd("BufWritePre",{
        group=augroup,
        buffer=buffer,
        callback=function ()
          vim.lsp.buf.format({bufnr=buffer})
        end
      })
    end
  end

}
return opts

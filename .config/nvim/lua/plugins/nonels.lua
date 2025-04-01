return {
  "nvimtools/none-ls.nvim",
  ft="go",

  opts = function(_, opts)
    local nls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    opts.sources = vim.list_extend(opts.sources or {}, {
--     nls.builtins.code_actions.gomodifytags,
--     nls.builtins.code_actions.impl,
--     nls.builtins.diagnostics.golangci_lint,
      nls.builtins.formatting.gofumpt,
      nls.builtins.formatting.goimports_reviser,
      nls.builtins.formatting.golines,
    })
    opts.on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr})
          end,
        })
      end
    end
    return opts
  end,
}

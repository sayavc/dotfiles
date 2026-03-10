return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
          end

          map("gd",         vim.lsp.buf.definition,     "перейти к определению")
          map("gr",         vim.lsp.buf.references,      "все использования")
          map("K",          vim.lsp.buf.hover,           "документация")
          map("<leader>rn", vim.lsp.buf.rename,          "переименовать")
          map("<leader>ca", vim.lsp.buf.code_action,     "code action")
          map("<leader>d",  vim.diagnostic.open_float,   "показать ошибку")
          map("[d",         vim.diagnostic.goto_prev,    "предыдущая ошибка")
          map("]d",         vim.diagnostic.goto_next,    "следующая ошибка")
        end,
      },
      tools = {
        hover_actions = { auto_focus = true },
      },
    }
  end,
}

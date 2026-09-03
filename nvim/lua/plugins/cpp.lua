return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "p00f/clangd_extensions.nvim" },
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
      },
    },
    config = function(_, opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("clangd_extensions").setup({
        server = {
          cmd = opts.servers.clangd.cmd,
          init_options = opts.servers.clangd.init_options,
          capabilities = capabilities,
        },
      })

      require("lspconfig").clangd.setup({
          cmd = opts.servers.clangd.cmd,
          init_options = opts.servers.clangd.init_options,
          capabilities = capabilities,
      })
    end,
  },

  {
    "Civitasv/cmake-tools.nvim",
    opts = {
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    },
  },
}

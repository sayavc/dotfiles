return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        -- Открыть/закрыть доку вручную:
        ["<C-d>"] = cmp.mapping(function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end),
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local label = vim_item.abbr
          local truncated_label = vim.fn.strcharpart(label, 0, 25)
          if truncated_label ~= label then
            vim_item.abbr = truncated_label .. "…"
          end

          local menu_text = entry.completion_item.detail or entry.completion_item.documentation
          if type(menu_text) == "table" then
            menu_text = menu_text.value
          end

          if menu_text and menu_text ~= "" then
            local truncated_menu = vim.fn.strcharpart(menu_text, 0, 30)
            if truncated_menu ~= menu_text then
              vim_item.menu = truncated_menu .. "…"
            else
              vim_item.menu = menu_text
            end
          else
            vim_item.menu = ""
          end

          return vim_item
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      window = {
        completion = cmp.config.window.bordered({
          max_width = 45,
        }),
        documentation = cmp.config.window.bordered({
          max_width = 50,
          max_height = 12,
        }),
      },
    })
  end,
}

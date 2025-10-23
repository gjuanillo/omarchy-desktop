return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    opts = {
      check_ts = true, -- Treesitter integration
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)

      local ok, cmp = pcall(require, "cmp")
      if ok then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        -- ensure no duplicate event hooks
        cmp.event:off("confirm_done", cmp_autopairs.on_confirm_done())
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },
}

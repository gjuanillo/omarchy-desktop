return {
  "elmcgill/springboot-nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls",
  },
  ft = { "java" }, -- Load only when editing Java files
  config = function()
    local springboot = require("springboot-nvim")

    springboot.setup({})

    -- Keymaps (LazyVim convention included)
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>Jr", springboot.boot_run, { desc = "[J]ava Spring Boot [R]un" })
    map("n", "<leader>Jc", springboot.generate_class, { desc = "[J]ava Spring Boot Create [C]lass" })
    map("n", "<leader>Ji", springboot.generate_interface, { desc = "[J]ava Spring Boot Create [I]nterface" })
    map("n", "<leader>Je", springboot.generate_enum, { desc = "[J]ava Spring Boot Create [E]num" })
  end,
}

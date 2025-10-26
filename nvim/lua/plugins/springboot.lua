return {
  "elmcgill/springboot-nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls",
  },
  ft = { "java" },
  config = function()
    local springboot = require("springboot-nvim")

    springboot.setup({
      root_markers = { "pom.xml", "build.gradle", "mvnw", "gradlew" },
      root_dir = function(fname)
        local root = vim.fs.find({
          "pom.xml",
          "build.gradle",
          "mvnw",
          "gradlew",
          ".git",
        }, { upward = true, path = fname })[1]
        return root and vim.fs.dirname(root) or nil
      end,
    })

    local map = vim.keymap.set
    map("n", "<leader>Jr", springboot.boot_run, { desc = "[J]ava Spring Boot [R]un" })
    map("n", "<leader>Jc", springboot.generate_class, { desc = "[J]ava Spring Boot Create [C]lass" })
    map("n", "<leader>Ji", springboot.generate_interface, { desc = "[J]ava Spring Boot Create [I]nterface" })
    map("n", "<leader>Je", springboot.generate_enum, { desc = "[J]ava Spring Boot Create [E]num" })
  end,
}

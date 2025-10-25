return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "nvim-dap",
      "nvim-dap-ui",
    },
    config = function()
      local jdtls = require("jdtls")

      local mason_packages = vim.fn.expand("~/.local/share/nvim/mason/packages")
      local jdtls_path = mason_packages .. "/jdtls"
      local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local config = jdtls_path .. "/config_linux"
      local lombok = jdtls_path .. "/lombok.jar"

      local workspace = vim.fn.stdpath("data") .. "/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

      local bundles = {}
      local java_debug = mason_packages .. "/java-debug-adapter"
      vim.list_extend(bundles, vim.split(vim.fn.glob(java_debug .. "/extension/server/*.jar", 1), "\n"))

      local java_test = mason_packages .. "/java-test"
      vim.list_extend(bundles, vim.split(vim.fn.glob(java_test .. "/extension/server/*.jar", 1), "\n"))

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew" })

      local config_opts = {
        cmd = {
          "java",
          "-javaagent:" .. lombok,
          "-jar",
          launcher,
          "-configuration",
          config,
          "-data",
          workspace,
        },
        root_dir = root_dir,
        settings = {
          java = {
            signatureHelp = { enabled = true },
            import = { enabled = true },
            configuration = { updateBuildConfiguration = "interactive" },
          },
        },
        capabilities = capabilities,
        init_options = { bundles = bundles },
        on_attach = function(_, bufnr)
          jdtls.setup_dap({ hotcodereplace = "auto" })
          jdtls.setup_dap_main_class_configs()
          jdtls.setup.add_commands()

          -- Java specific keymaps
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = bufnr })
          end

          map("n", "<leader>Jo", jdtls.organize_imports, "Organize Imports")
          map("n", "<leader>Jv", jdtls.extract_variable, "Extract Variable")
          map("v", "<leader>Jv", function()
            jdtls.extract_variable(true)
          end, "Extract Variable")
          map("n", "<leader>JC", jdtls.extract_constant, "Extract Constant")
          map("v", "<leader>JC", function()
            jdtls.extract_constant(true)
          end, "Extract Constant")
          map("n", "<leader>Jt", jdtls.test_nearest_method, "Test Nearest")
          map("n", "<leader>JT", jdtls.test_class, "Test Class")
        end,
      }

      jdtls.start_or_attach(config_opts)
    end,
  },
}

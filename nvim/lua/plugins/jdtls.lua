return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
    },
    config = function()
      local jdtls = require("jdtls")
      local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
      local jdtls_path = mason_packages .. "/jdtls"

      local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local config = jdtls_path .. "/config_linux"
      local lombok = jdtls_path .. "/lombok.jar"

      local workspace = vim.fn.stdpath("data") .. "/jdtls/workspaces/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

      local bundles = {}
      vim.list_extend(
        bundles,
        vim.split(vim.fn.glob(mason_packages .. "/java-debug-adapter/extension/server/*.jar", 1), "\n")
      )
      vim.list_extend(bundles, vim.split(vim.fn.glob(mason_packages .. "/java-test/extension/server/*.jar", 1), "\n"))

      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = ok and cmp_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

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
        root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew" }),
        capabilities = capabilities,
        init_options = { bundles = bundles },
        on_attach = function(_, bufnr)
          jdtls.setup_dap({ hotcodereplace = "auto" })
          jdtls.setup.add_commands()

          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = bufnr })
          end

          map("n", "<leader>Jo", jdtls.organize_imports, "Organize Imports")
          map("n", "<leader>Jv", jdtls.extract_variable, "Extract Variable")
          map("v", "<leader>Jv", function()
            jdtls.extract_variable(true)
          end)
          map("n", "<leader>JC", jdtls.extract_constant, "Extract Constant")
          map("v", "<leader>JC", function()
            jdtls.extract_constant(true)
          end)
          map("n", "<leader>Jt", jdtls.test_nearest_method, "Test Nearest")
          map("n", "<leader>JT", jdtls.test_class, "Test Class")
        end,
      }

      jdtls.start_or_attach(config_opts)
    end,
  },
}

<<<<<<< HEAD
return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ruby_ls", "tsserver", "html", "cssls", "bashls", "sqlls", "dockerls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      lazy = false
      local lsp = require("lspconfig")
      lsp.util.default_config = vim.tbl_extend( "force", lsp.util.default_config,
        { on_attach = function(client) client.server_capabilities.semanticTokensProvider = nil end })
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lsp.lua_ls.setup({ capabilities = capabilities })
      lsp.ruby_ls.setup({ capabilities = capabilities })
      lsp.dockerls.setup({ capabilities = capabilities })
      local toggle_diagnostic = function()
        if vim.diagnostic.is_disabled() then
          vim.diagnostic.enable()
        else
          vim.diagnostic.disable()
        end
      end
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>td', toggle_diagnostic, {})
    end,
  },
}
=======
return {}
--return {
--  {
--    "hrsh7th/cmp-nvim-lsp",
--  },
--  {
--    "williamboman/mason.nvim",
--    lazy = false,
--    config = function()
--      require("mason").setup()
--    end,
--  },
--  {
--    "williamboman/mason-lspconfig.nvim",
--    lazy = false,
--    opts = {
--      auto_install = true,
--    },
--    config = function()
--      require("mason-lspconfig").setup({
--        ensure_installed = { "solargraph" }
--      })
--    end,
--  },
--  {
--    "neovim/nvim-lspconfig",
--    lazy = false,
--    config = function()
--      local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--      local lspconfig = require("lspconfig")
--      lspconfig.solargraph.setup({
--        capabilities = capabilities
--      })
--
--      lspconfig.html.setup({
--        capabilities = capabilities
--      })
--
--      lspconfig.lua_ls.setup({
--        capabilities = capabilities
--      })
--
--      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
--      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--    end,
--  },
--}
>>>>>>> f2a7173 (Markdown and others)

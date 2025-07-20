return {
  "olimorris/codecompanion.nvim",
  -- Lazy-load until a command or keybinding is used
  cmd = { "CodeCompanion", "CodeCompanionActions" },
  keys = {
    {
      "<leader>ca",
      "<cmd>CodeCompanionActions<CR>",
      mode = { "n", "v" },
      desc = "Code Companion [A]ctions (Gemini)",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    strategies = {
      -- Change the default chat adapter
      chat = {
        adapter = "gemini",
      },
    },
    opts = {
      -- Set debug logging
      log_level = "DEBUG",
    },
  },
}



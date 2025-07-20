return {
  "olimorris/codecompanion.nvim",
  opts = {
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true
        }
      }
    },
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
      cmd = {
        adapter = "gemini",
      }
    },
    -- 1. Set the default agent for all actions.
    agent = "gemini",

    -- 2. Configure credentials and options for each agent.
    agents = {
      gemini = {
        -- Tip: Ensure this environment variable is set and accessible by Neovim.
        api_key = os.getenv("GEMINI_API_KEY"),
        -- NOTE: The model you specified might be incorrect.
        -- The current model is "gemini-1.5-pro-latest".
        model = "gemini-2.5-pro-latest",
      },
    },
  },
  dependencies = {
    "OXY2DEV/markview.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim"
  },
}

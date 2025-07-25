-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
      -- Add this line to hide the message
      experimental = {
        check_rtp_message = false,
      },
    },
  -- dependencies = {
    --  "nvim-treesitter/nvim-treesitter", -- Ensure treesitter is loaded before markview
   --  },

  -- For blink.cmp's completion
    -- source
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- },
}

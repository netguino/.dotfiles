<<<<<<< HEAD
-- Tree based highlighting
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
=======
return {}
--return {
--  {
--    "nvim-treesitter/nvim-treesitter",
--    build = ":TSUpdate",
--    config = function()
--      local config = require("nvim-treesitter.configs")
--      config.setup({
--        auto_install = true,
--        highlight = { enable = true },
--        indent = { enable = true },
--      })
--    end
--  }
--}
>>>>>>> f2a7173 (Markdown and others)

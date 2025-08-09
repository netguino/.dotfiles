
-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- For blink.cmp's completion
    -- source
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "saghen/blink.cmp"
    },
};

return {
  "voldikss/vim-floaterm",
  config = function()
    vim.keymap.set("n", "<leader>q", ":FloatermNew<CR>", {})
  end
}

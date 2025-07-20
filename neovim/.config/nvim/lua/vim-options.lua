vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cmdheight=1")

vim.cmd("set clipboard+=unnamedplus")

-- leader key to space --
vim.g.mapleader = " "

vim.keymap.set('n', '<c-z>', ':undo<CR>')

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Harpoon --
--vim.keymap.set('n', '<c-h-a>', ':lua require("harpoon.mark").add_file()<CR>')
--vim.keymap.set('n', '<c-h-l>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

vim.wo.number = true

---- Delete whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Diagnostic settings
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = false,
}



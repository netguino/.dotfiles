return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    config = function(_, opts)
      -- This function runs after the plugin is loaded, ensuring `require('harpoon')` is safe
      local harpoon = require('harpoon')
      harpoon:setup(opts)

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
          end

          require("telescope.pickers").new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                  results = file_paths,
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
          }):find()
      end
    end,
    keys = {
      { '<leader>a', function() require('harpoon'):list():add() end, desc = 'Harpoon: Add file' },
      { '<leader>h', function() require('harpoon'):list():next() end, desc = 'Harpoon: Next file' },
      { '<leader>t', function() require('harpoon'):list():prev() end, desc = 'Harpoon: Previous file' },
      { '<leader>e', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = 'Harpoon: Toggle Quick Menu' },
    },
}

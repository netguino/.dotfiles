-- In your plugins/cmp.lua (or similar) file:
return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Required for LSP completions
    'hrsh7th/cmp-buffer',   -- Required for buffer completions
    'hrsh7th/cmp-path',     -- Required for path completions
    'saadparwaiz1/cmp_luasnip', -- For snippet completions (if using luasnip)
    'L3MON4D3/LuaSnip',     -- Snippet engine (if using luasnip)
  },
  opts = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    return {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Setj `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' },
        { name = 'path' },
        -- THIS IS THE IMPORTANT LINE FOR CODECOMPANION
        { name = 'codecompanion' },
      }),
      formatting = {
        format = function(entry, vim_item)
          -- Get the original kind value, default to empty string if nil
          local original_kind = vim_item.kind or ''
          local lsp_kind_label = nil

          -- Safely attempt to get the LSP kind label if cmp.lsp and cmp.lsp.kind are available
          if cmp.lsp and cmp.lsp.kind and original_kind ~= '' then
            lsp_kind_label = cmp.lsp.kind[original_kind]
          end

          -- If an LSP label exists, prepend it. Otherwise, use the original kind.
          if lsp_kind_label then
            vim_item.kind = string.format('%s %s', lsp_kind_label, original_kind)
          else
            -- If not an LSP kind or if original_kind was nil/empty, just use the original value
            vim_item.kind = original_kind
          end

          -- Show a distinction for CodeCompanion source
          if entry.source.name == 'codecompanion' then
            vim_item.kind = '🤖 ' .. (vim_item.kind or 'Unknown') -- Ensure it's never nil here
            vim_item.menu = '[CC]'
          end
          return vim_item
        end,
      },
      -- You can add other cmp options here, like window, experimental, etc.
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}


vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1

require('nvim-tree').setup({
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
	git = {
          unstaged = " ",
	  staged =  " ",
	},
      },
    },
  },
})
require('gitsigns').setup()

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'ghdl_ls', 'lua_ls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- lsp-config signs.
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- CMP setup.
local cmp = require('cmp')
local luasnip = require('luasnip')

luasnip.config.setup {}

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
      ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
      -- C-b (back) C-f (forward) for snippet placeholder navigation.
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    }),
    window = {
      documentation = cmp.config.window.bordered()
    },
    sources = {
      { name = 'nvim-lsp' },
      { name = 'luasnip' },
    },
}

vim.keymap.set('n', '<C-b>', require('nvim-tree.api').tree.toggle)

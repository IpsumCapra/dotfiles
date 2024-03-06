vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1
vim.opt.fillchars={ eob = ' ', vert = '▎', diff = '' }
vim.diagnostic.config({
  virtual_text = false,
})

vim.opt.list = true
vim.opt.listchars:append {
  lead="·",
  eol = "↴",
  extends = "›",
  precedes = "‹",
  nbsp = "·",
  trail = "·",
}

require('ibl').setup ()

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  }
}

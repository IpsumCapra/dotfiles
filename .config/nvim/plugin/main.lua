vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1
vim.opt.fillchars={ eob = ' ', vert = '▎', diff = '╱' }
vim.diagnostic.config({
  virtual_text = false,
})


require('gitsigns').setup()

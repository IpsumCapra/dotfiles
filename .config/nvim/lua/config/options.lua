-- General options
vim.opt.number = true      -- Show line numbers
vim.opt.tabstop = 2        -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 2     -- Size of an indent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart indentation
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

function _G.customFoldText()
  return vim.fn.getline(vim.v.foldstart) .. '...' .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
end

vim.opt.foldtext = 'v:lua.customFoldText()'
vim.opt.fillchars = 'fold: '
vim.opt.foldlevel = 99

vim.opt.wrap = false

vim.opt.cursorline = true

vim.opt.mousemodel = "extend"

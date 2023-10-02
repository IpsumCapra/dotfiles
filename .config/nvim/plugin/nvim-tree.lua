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

vim.keymap.set('n', '<C-b>', function()
  if require('nvim-tree.view').is_visible() then
    require'nvim-tree.api'.tree.close()
    require'barbar.api'.set_offset(0)
  else
    require'barbar.api'.set_offset(30, 'File Explorer')
    require'nvim-tree.api'.tree.open()
  end
end)


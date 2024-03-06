vim.keymap.set('n', '<C-k>', function()
  if next(require('diffview.lib').views) == nil then
    local vcs = require('galaxyline.provider_vcs')
    local branch_name = vcs.get_git_branch()
    if branch_name ~= nil then
      vim.cmd('DiffviewOpen')
      require'barbar.api'.set_offset(35, '  Version Control')
    end
  else
    vim.cmd('DiffviewClose')
    if require('nvim-tree.view').is_visible() then
      require'barbar.api'.set_offset(30, '󰉓  File Explorer')
    else
      require'barbar.api'.set_offset(0)
    end
  end
end)

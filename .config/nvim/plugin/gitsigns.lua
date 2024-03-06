require('gitsigns').setup()

local function gitsigns_visual_op(op)
  return function()
    return require('gitsigns')[op]({ vim.fn.line("."), vim.fn.line("v") })
  end
end

local gs = require('gitsigns')

local map = vim.keymap.set

map('n', '<leader>hs', gs.stage_hunk, { noremap = true })
map('n', '<leader>hr', gs.reset_hunk, { noremap = true })
map('n', '<leader>hu', gs.undo_stage_hunk, { noremap = true })
map('n', '<leader>hf', gs.refresh, { noremap = true })
map('n', '<leader>hS', gs.stage_buffer, { noremap = true })
map('n', '<leader>hR', gs.reset_buffer, { noremap = true })
map('n', '<leader>htd', gs.toggle_deleted, { noremap = true })


map('v', '<leader>hs', gitsigns_visual_op('stage_hunk'), { noremap = true })
map('v', '<leader>hr', gitsigns_visual_op('reset_hunk'), { noremap = true })
map('v', '<leader>hu', gitsigns_visual_op('undo_stage_hunk'), { noremap = true })

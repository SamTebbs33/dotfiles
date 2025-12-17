require ("mini.files").setup()
require("mini.icons").setup({
  -- Icon style: 'glyph' or 'ascii'
  style = 'ascii',

  -- Customize per category. See `:h MiniIcons.config` for details.
  default   = {},
  directory = {},
  extension = {},
  file      = {},
  filetype  = {},
  lsp       = {},
  os        = {},

  -- Control which extensions will be considered during "file" resolution
  use_file_extension = function(ext, file) return true end,
})


-- MiniFiles
-- Open explorer at parent of current directory
vim.keymap.set("n", "<leader>t", function()
    if not MiniFiles.close() then MiniFiles.open(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':h')) end
end)

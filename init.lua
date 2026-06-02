require("options")
require("keymaps")
require("plugins.lazy")
require("plugins.options")
require("plugins.keymaps")
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.cmd("colorscheme tokyonight-night")
builtin = require('telescope.builtin')
--require("bufferline").setup{}

vim.diagnostic.config({
  underline = { severity = { min = vim.diagnostic.severity.ERROR } },
})

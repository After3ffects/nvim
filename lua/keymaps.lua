local filerunner = require("filerunner")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '`', ':botright 12 split | terminal<CR>')    
vim.keymap.set('n', '<F5>', filerunner.runfile) 


local keyskip = function(char)
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    if line:sub(col, col) == char then
        return '<Right>'
    else
        print(line:sub(col, col))
        return char
    end
end

vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')

vim.keymap.set('i', '}', function() return keyskip('}') end, { expr = true, noremap = true})
vim.keymap.set('i', ')', function() return keyskip(')') end, { expr = true, noremap = true})
vim.keymap.set('i', ']', function() return keyskip(']') end, { expr = true, noremap = true})

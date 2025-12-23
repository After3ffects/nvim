local M = {}

M.runfile = function()
    local filetype = vim.bo.filetype
    local filepath = vim.fn.expand('%:p')             -- Get the full path of the current file
    local directory = vim.fn.fnamemodify(filepath, ':h') -- Get the directory of the file
    local filename = vim.fn.expand('%:t:r')
    local write = ":wa"

    vim.cmd(write)

    if filetype == "c" then
        local command = string.format([[botright 12split | terminal cmd.exe /k "cd /d %s && gcc "%s" -o "%s" && "%s.exe" && rm -f "%s.exe""]], directory, filepath, filename, filename, filename)
        vim.cmd(command)
    elseif filetype == "python" then
        local command = string.format(":botright 12split | terminal cd %s && python %s", directory, filepath)
        vim.cmd(command)
    end
end 

M.runfileVenv = function()
    local filetype = vim.bo.filetype
    local filepath = vim.fn.expand('%:p')             -- Get the full path of the current file
    local directory = vim.fn.fnamemodify(filepath, ':h') -- Get the directory of the file
    local filename = vim.fn.expand('%:t:r')
    local write = ":wa"

    vim.cmd(write)

    local command = string.format(
        "botright 12split | terminal bash -lc 'cd %q && source .venv/bin/activate && python %q'",
        directory, filepath
      )
    vim.cmd(command)
end
    
return M 

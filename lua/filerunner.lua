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
        local command = string.format(":terminal cmd='cd %s && python %s' <CR>", directory, filepath)
        vim.cmd(command)
    end
end 
return M 

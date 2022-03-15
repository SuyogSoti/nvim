Filetree = {}

-- MyNvimTreeToggle()
function Filetree:MyNvimTreeToggle()
  local treeBufName = "NvimTree"
  if vim.fn.exists(treeBufName) and vim.fn.bufwinnr(treeBufName) ~= -1 then
    vim.cmd("NvimTreeToggle")
  elseif vim.fn.expand("%") == '' then
    vim.cmd("NvimTreeToggle")
  else
    vim.cmd("NvimTreeFindFile")
  end
end

return Filetree

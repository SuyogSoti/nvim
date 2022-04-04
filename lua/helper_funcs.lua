-- Am I at work?
function inCitc()
  citc_path = "/google/src/cloud/suyogsoti/"
  path = vim.loop.cwd()
  return vim.startswith(path, citc_path) and vim.endswith(path, "/google3")
end

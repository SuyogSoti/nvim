-- Am I at work?
function inCitc()
  work_path = "/google/src/cloud/suyogsoti/"
  path = vim.loop.cwd()
  return string.find(path, work_path) and vim.endswith(path, "/google3")
end

-- Am I at work?
function inDatabricks()
  work_path = "/Users/suyog.soti/code/universe"
  path = vim.loop.cwd()
  return vim.startswith(path, work_path)
end

function getSearchableFiles()
  if inCitc() then
    return {
      "java/com/google/api",
      "javatests/com/google/api",
      "apiserving/tenant",
      "apiserving/serviceagentmanager",
      "google/api",
    }
  elseif inDatabricks() then
      return {
        "ratelimit-v2",
        "common",
        "apiproxy",
        "servicemesh-control",
        "dummyservice",
        "armeria",
        "dicer",
        "pop-proxy",
        "envoy",
      }
  else
    return {
    }
  end
end

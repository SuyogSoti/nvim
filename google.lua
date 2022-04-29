require("helper_funcs")
local Job = require'plenary.job'

-- ToCritique
function HgUpload (self, code, signal)
  if code ~= 0 then
    return
  end
  print("Hg Evolve Tree Success. Uploading...")
  Job:new({
    command = 'hg',
    args = { 'upload', "tree" },
    on_exit = function(self, code, signal)
      if code == 0 then
        print("Hg Upload Tree Success")
      end
    end,
    on_stderr = function(err, data, job)
      print("hg upload FAILED:", data)
    end,
  }):start()
end

function HgEvolve (self, code, signal)
  print("Hg Amend Succeeded. Running Hg Evolve...")
  Job:new({
    command = 'hg',
    args = { 'evolve' },
    on_exit = HgUpload,
    on_stderr = function(err, data, job)
      print("hg Evolve stderr:", data)
    end,
  }):start()
end

function HgAmend (self, code, signal)
  if table.getn(self._stderr_results) > 0 or code ~= 0 then
    return
  end
  Job:new({
    command = 'hg',
    args = { 'amend' },
    enable_recording = true,
    on_exit = function(self, code, signal) 
      if code == 0 then
        HgEvolve(self, code, signal)
      end
    end,
    on_stdout = function(err, data, job) 
      print("hg amend stdout:", data)
      if data == "nothing changed" then -- The status is not 0 in this case
        print("Running Hg Evolve")
        HgEvolve(self, code, signal)
      end
    end,
    on_stderr = function(err, data, job)
      print("hg amend FAILED:", data)
    end,
  }):start()
end

function HgAdd (self, code, signal)
  Job:new({
    command = 'hg',
    args = { 'add', "." },
    enable_recording = true,
    on_exit = HgAmend,
  }):start()
end

function Fix(cmd, extCmd)
  Job:new({
    command = cmd,
    args = { 'fix' },
    enable_recording = true,
    on_exit = extCmd,
    on_stdout = function(err, data, job)
      print(cmd, "fix stdout:", data)
    end,
    on_stderr = function(err, data, job)
      print(cmd, "fix FAILED:", data)
    end,
  }):start()
end

function g4Upload(self, code, signal)
  print("G4 Fix Success. Uploading...")
  Job:new({
    command = 'g4',
    args = { 'upload' },
    on_exit = function(self, code, signal)
      if code == 0 then
        print("g4 Upload Success")
      end
    end,
    on_stderr = function(err, data, job)
      print("g4 upload FAILED:", data)
    end,
  }):start()
end

function ToCritique()
  if not inCitc() then
    print("Aborting: You are not in a citc")
    return
  end
  Job:new({
    command = 'hg',
    args = { 'status' },
    on_exit = function(self, code, signal)
      if code == 0 then
        Fix("hg", HgAdd)
      else
        Fix("g4", g4Upload)
      end
    end,
  }):start()
end

-- Key maps
vim.keymap.set('n', '<leader>ma', ToCritique)
vim.keymap.set("n", "<leader>p", function ()
  local search_dirs = {
    "java/com/google/api",
    "javatests/com/google/api",
    "apiserving",
    "google/api"
  }
  require("telescope.builtin").find_files{
    find_command = {"pfind", "-type", "f", unpack(search_dirs)},
    follow = false,
    hidden = false,
    no_ignore = false,
  }
end)

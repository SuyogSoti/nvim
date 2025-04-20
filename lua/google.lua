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

local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')
local cmd = {'ssh', 'suyog.c.googlers.com', '/google/bin/releases/cider/ciderlsp/ciderlsp', '--tooltag=nvim-lsp' , '--noforward_sync_responses'}
if vim.fn.hostname() == "suyog.c.googlers.com" then
  cmd = {'/google/bin/releases/cider/ciderlsp/ciderlsp', '--tooltag=nvim-lsp' , '--noforward_sync_responses'}
end
configs.ciderlsp = {
  default_config = {
    cmd = cmd;
    filetypes = {'c', 'cpp', 'java', 'proto', 'textproto', 'go', 'python', 'bzl'};
    root_dir = nvim_lsp.util.root_pattern('BUILD');
    settings = {};
  }
}

-- Setup CiderLSP.
nvim_lsp.ciderlsp.setup{
  on_attach = function(client, bufnr)
    -- Omni-completion via LSP. See `:help compl-omni`. Use <C-x><C-o> in
    -- insert mode. Or use an external autocompleter (see below) for a
    -- smoother UX.
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    if vim.lsp.formatexpr then -- Neovim v0.6.0+ only.
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")
    end
    if vim.lsp.tagfunc then -- Neovim v0.6.0+ only.
      -- Tag functionality via LSP. See `:help tag-commands`. Use <c-]> to
      -- go-to-definition.
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end
  end
}



-- Some filetypes and make sure we know how to find file diffs
vim.cmd([[
autocmd BufNewFile,BufRead *.sdl set ft=sql
autocmd BufNewFile,BufRead *.pi set ft=python

let g:signify_vcs_list = ['hg']
]])


-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  pkgs = { "debugpy", "mypy", "black", "pyright", "isort", "djlsp" },
}

-- M.mason.pkgs = {
--   pyright={
--     opts={
--       pythonPath="/Users/palash/miniconda3/bin/python"
--     }
--   },
-- }
-- M.mason.pkgs = {
--   "pyright",
-- }
vim.cmd "highlight St_relativepath guifg=#626a83 guibg=#2a2b36"

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.ui = {
  statusline = {
    theme = "default",
    order = { "mode", "relativepath", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      relativepath = function()
        local path = vim.api.nvim_buf_get_name(stbufnr())

        if path == "" then
          return ""
        end

        return "%#St_relativepath#  " .. vim.fn.expand "%:.:h" .. " /"
      end,
    },
  },
}
return M

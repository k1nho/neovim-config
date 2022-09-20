require('kin.base');
require('kin.highlights')
require('kin.keymaps')
require('kin.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local isMac = has "macunix"

if isMac then
  require('kin.macos')
end

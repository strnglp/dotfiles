-- [[ plug.lua ]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'

-- [[ Plugins Go Here ]]
use 'mhinz/vim-startify'-- start page
use 'junegunn/goyo.vim' -- distraction free writing
use 'wuelnerdotexe/vim-astro' -- blog dev
-- fuzzy find
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- file tree
use {
  'kyazdani42/nvim-tree.lua',
  config = function() require('nvim-tree').setup() end,
  requires = 'kyazdani42/nvim-web-devicons'
}

-- hex/css coloring
use {
  'norcalli/nvim-colorizer.lua',
  config = function() require('colorizer').setup() end
}
  
-- status line
use {
  'nvim-lualine/lualine.nvim',
  config = function() require('lualine').setup { 
    options = { theme = 'auto' }
    --options = { theme = 'PaperColor' }
  } end,
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

-- [[ Theme ]]
use 'koron/vim-monochromenote'
use 'Th3Whit3Wolf/one-nvim'
use 'navarasu/onedark.nvim'
use 'NLKNguyen/papercolor-theme'
use 'preservim/vim-colors-pencil'

end)

-- [[ REMEMBER TO RUN PackerCompile AFTER CHANGES ]]

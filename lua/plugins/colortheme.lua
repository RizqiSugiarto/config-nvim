return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Set up the Kanagawa colorscheme with custom options
    require('kanagawa').setup {
      compile = false, -- Enable compiling the colorscheme
      undercurl = true, -- Enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- Do not set background color
      dimInactive = false, -- Dim inactive window
      terminalColors = true, -- Define terminal colors
      colors = { -- Add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- Add/modify highlights
        return {}
      end,
      theme = 'wave', -- Load "wave" theme by default
      background = { -- Map the value of 'background' option to a theme
        dark = 'wave', -- Try "dragon" for dark
        light = 'lotus', -- Try "lotus" for light
      },
    }

    -- Load the colorscheme
    vim.cmd 'colorscheme kanagawa'
  end,
}

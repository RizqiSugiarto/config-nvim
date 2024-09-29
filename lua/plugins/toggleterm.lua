return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local toggleterm = require 'toggleterm'

    -- Setup toggleterm with custom options
    toggleterm.setup {
      open_mapping = [[<c-t]], -- The key mapping to open the terminal
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      size = 20,
      direction = 'horizontal', -- Can be 'horizontal', 'vertical', or 'tab'
    }

    -- Function to resize the terminal
    local function resize_term(delta)
      local term = toggleterm.get_terminal()
      if term then
        term.size = math.max(1, term.size + delta) -- Ensure size doesn't go below 1
        toggleterm.update_terminal_size(term)
      end
    end

    -- Function to create a new terminal instance
    local function new_terminal()
      toggleterm.exec('bash', nil, true) -- Execute a new terminal instance with bash
    end

    -- Register new_terminal as a command for use in mappings
    vim.api.nvim_create_user_command('NewTerminal', new_terminal, {})

    -- Key mappings for terminal actions
    vim.api.nvim_set_keymap('n', '<c-t>', ':ToggleTerm<CR>', { noremap = true, silent = true }) -- Open/close terminal
    vim.api.nvim_set_keymap('n', '<leader>+', ':lua resize_term(2)<CR>', { noremap = true, silent = true }) -- Increase size
    vim.api.nvim_set_keymap('n', '<leader>-', ':lua resize_term(-2)<CR>', { noremap = true, silent = true }) -- Decrease size
    vim.api.nvim_set_keymap('t', '<C-Up>', '<C-\\><C-n>', { noremap = true, silent = true }) -- Exit terminal mode with Ctrl + Up
    vim.api.nvim_set_keymap('t', '<C-Down>', '<C-\\><C-n><C-w>p', { noremap = true, silent = true }) -- Switch back to previous buffer with Ctrl + Down
    vim.api.nvim_set_keymap('n', '<leader>n', ':NewTerminal<CR>', { noremap = true, silent = true }) -- Create new terminal with <leader>n
  end,
}

" =========================================================
" Plugins (vim-plug)
" =========================================================

" Bootstrap vim-plug if it is not installed yet
let s:plug_path = stdpath('data') . '/site/autoload/plug.vim'
let s:plug_fresh = 0
if empty(glob(s:plug_path))
  silent execute '!curl -fLo ' . shellescape(s:plug_path) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  let s:plug_fresh = filereadable(s:plug_path)
endif
" The site/ dir may not have existed at startup (so it is not in
" 'runtimepath' yet): source the freshly downloaded file directly.
if s:plug_fresh
  execute 'source ' . fnameescape(s:plug_path)
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'stevearc/dressing.nvim'
Plug 'ziontee113/icon-picker.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Plugin setup (key bindings live in keymaps.vim)
lua << LUA
-- Skip on first run, before plugins are installed
if not pcall(require, "telescope") then return end
require("telescope").setup({})
require("dressing").setup({
    select = {
        backend = { "telescope" }
    }
})
require("icon-picker").setup({
    disable_legacy_commands = true
})
LUA

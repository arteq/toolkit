" =========================================================
" Neovim entry point - only sets the leader and loads the
" modules below (order matters: plugins first, then the rest)
"
"   plugins.vim     vim-plug bootstrap, plugin list, lua setup
"   options.vim     editor behaviour (indent, mouse, timeouts, autocmds)
"   coc.vim         coc.nvim (completion / LSP) settings
"   keymaps.vim     ALL key bindings
"   appearance.vim  colors, highlights, airline
" =========================================================

" Leader = space (must be set before any <leader> mapping)
let mapleader = " "
let maplocalleader = " "

runtime plugins.vim
runtime options.vim
runtime coc.vim
runtime keymaps.vim
runtime appearance.vim

" Leader = space
let mapleader = " "
let maplocalleader = " "

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

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'stevearc/dressing.nvim'
Plug 'ziontee113/icon-picker.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Icon picker init
lua << EOF
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
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal emoji symbols<cr>", opts)
vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert emoji symbols<cr>", opts)
EOF

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * if exists('*CocActionAsync') | silent call CocActionAsync('highlight') | endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
if has_key(g:plugs, 'coc.nvim') && isdirectory(g:plugs['coc.nvim'].dir)
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endif

set signcolumn=no
" set number
" set termguicolors
set background=dark
colorscheme industry
highlight LineNr ctermfg=yellow ctermbg=8
highlight Normal ctermbg=black
set tabstop=4
set sw=4
" set mouse+=a
set mouse=
set modeline
set modelines=2

set ttimeoutlen=100
map <C-t> :tabnew<CR>
noremap <Super_L-Right> :tabnext<CR>
noremap <Super_L-Left> :tabprevious<CR>
noremap <A-Right> :tabnext<CR>
noremap <A-Left> :tabprevious<CR>
inoremap <A-Right> <Esc>:tabnext<CR>
inoremap <A-Left> <Esc>:tabprevious<CR>

if has("autocmd")
	" jump to last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

	autocmd BufRead *.txt set ts=8 sw=8 
endif " has("autocmd")

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" autocomplete highlight color
highlight PmenuSel ctermbg=226 guibg=226
highlight Pmenu ctermbg=8 guibg=8 ctermfg=50 guifg=50

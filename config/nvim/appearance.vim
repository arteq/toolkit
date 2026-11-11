" =========================================================
" Appearance: colors, highlights, airline
" =========================================================

set signcolumn=no
" set number
" set termguicolors
set background=dark
colorscheme slate
highlight LineNr ctermfg=yellow ctermbg=8
highlight Normal ctermbg=black

" autocomplete highlight color
highlight PmenuSel ctermbg=226 guibg=226
highlight Pmenu ctermbg=8 guibg=8 ctermfg=50 guifg=50

" ---------------------------------------------------------
" air-line
" ---------------------------------------------------------
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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

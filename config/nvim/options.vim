" =========================================================
" Editor options and autocommands
" =========================================================

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Shorter updatetime (default 4000 ms) for a snappier experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Indentation
set tabstop=4
set sw=4

" Mouse disabled
" set mouse+=a
set mouse=

set modeline
set modelines=2

set ttimeoutlen=100

if has("autocmd")
	" jump to last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

	autocmd BufRead *.txt set ts=8 sw=8
endif " has("autocmd")

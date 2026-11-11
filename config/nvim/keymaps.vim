" =========================================================
" Key bindings (leader = space, set in init.vim)
" =========================================================

" ---------------------------------------------------------
" Tabs
" ---------------------------------------------------------
map <C-t> :tabnew<CR>
noremap <Super_L-Right> :tabnext<CR>
noremap <Super_L-Left> :tabprevious<CR>
noremap <A-Right> :tabnext<CR>
noremap <A-Left> :tabprevious<CR>
inoremap <A-Right> <Esc>:tabnext<CR>
inoremap <A-Left> <Esc>:tabprevious<CR>

" ---------------------------------------------------------
" Icon picker
" ---------------------------------------------------------
nnoremap <silent> <Leader><Leader>i <cmd>IconPickerNormal emoji symbols<cr>
inoremap <silent> <C-i> <cmd>IconPickerInsert emoji symbols<cr>

" ---------------------------------------------------------
" coc.nvim - completion
" ---------------------------------------------------------

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

" ---------------------------------------------------------
" coc.nvim - code actions
" ---------------------------------------------------------

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

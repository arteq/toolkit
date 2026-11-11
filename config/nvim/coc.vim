" =========================================================
" coc.nvim settings (key bindings are in keymaps.vim)
" =========================================================

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * if exists('*CocActionAsync') | silent call CocActionAsync('highlight') | endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
if has_key(g:plugs, 'coc.nvim') && isdirectory(g:plugs['coc.nvim'].dir)
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endif

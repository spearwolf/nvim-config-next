if ! exists('g:vscode')
    " nvim-tree
    map <silent> <F3> <Esc>:NvimTreeToggle<CR>
    nmap <silent> <F5> <Esc>:cd %:p:h<CR>:pwd<CR>

    " Tabs
    map <silent> <M-S-t> <Esc>:tabnew<CR>
    map <silent> <M-S-w> <Esc>:tabclose<CR>
    map <silent> <M-S-Left> <Esc>:tabprevious<CR>
    map <silent> <M-S-Right> <Esc>:tabnext<CR>
endif

" Copy'n'Paste
map <silent> <C-S-c> "+y
map <silent> <C-S-v> "+P
imap <silent> <C-S-v> <Esc>l"+Pli

" Home + End
nmap <silent> <Home> gg
nmap <silent> <End> G

" other
" unmap! <C-w>

" sneak
map <leader>s <Plug>Sneak_s
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T


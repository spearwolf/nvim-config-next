if ! exists('g:vscode')
    " nvim-tree
    map <silent> <F3> <Esc>:NvimTreeToggle<CR>
    map <silent> <F4> <Esc>:AerialToggle!<CR>
    nmap <silent> <F5> <Esc>:cd %:p:h<CR>:pwd<CR>

    " Tabs
    map <silent> <M-S-t> <Esc>:tabnew<CR>
    map <silent> <M-S-w> <Esc>:tabclose<CR>
    map <silent> <M-S-Left> <Esc>:tabprevious<CR>
    map <silent> <M-S-Right> <Esc>:tabnext<CR>

    map <silent> <M-S-t> <Esc>:tabnew<CR>
    nmap <silent> <C-K>s <Esc>:Telescope aerial<cr>
endif

" Copy'n'Paste
map <silent> <C-S-c> "+y
map <silent> <C-S-v> "+P
imap <silent> <C-S-v> <Esc>l"+Pli

" Copy to clipboard
vnoremap  <leader>y "+y
nnoremap  <leader>Y "+yg_
nnoremap  <leader>y "+y
nnoremap  <leader>yy "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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


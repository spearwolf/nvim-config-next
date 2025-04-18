if ! exists('g:vscode')
    map <silent> <F3> <Esc>:NvimTreeToggle<CR>
    map <silent> <F4> <Esc>:AerialToggle!<CR>
    nmap <silent> <F5> <Esc>:cd %:p:h<CR>:pwd<CR>
    nmap <silent> <F6> <Esc>:Telescope noice<CR>
    nmap <silent> <F8> <Esc>:LspRestart<CR>:echo "LSP Restarted!"<CR>

    " Tabs
    map <silent> <M-S-t> <Esc>:tabnew<CR>
    map <silent> <M-S-w> <Esc>:tabclose<CR>
    map <silent> <M-S-Left> <Esc>:tabprevious<CR>
    map <silent> <M-S-Right> <Esc>:tabnext<CR>

    map <silent> <M-S-t> <Esc>:tabnew<CR>
    nmap <silent> <C-K>s <Esc>:Telescope aerial<cr>

    "nmap <silent> <Leader>f <Esc>:Prettier<CR>
    "nmap <silent> <C-S-i> <Esc>:Prettier<CR>
endif

" Copy'n'Paste
nmap <silent> <C-S-c> "+y
vmap <silent> <C-S-c> "+y
map <silent> <C-S-v> "+p
imap <silent> <C-S-v> <Esc>"+pi

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


scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileformat=unix

"if exists('g:vscode')
"  set foldmethod=marker
"else
"  set foldmethod=expr
"  set foldexpr=nvim_treesitter#foldexpr()
"endif
set foldmethod=marker
set nofoldenable " Disable folding at startup.

set hlsearch
set incsearch
set smartcase

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Set to auto read when a file is changed from the outside
set autoread

" No need to show mode
set noshowmode

" Always show the signcolumn
set signcolumn=yes

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Allow changing buffer without saving it first
set hidden

" Always splits to the right and below
set splitright
set splitbelow

" Minimal number of screen lines to keep above and below the cursor
if exists('g:vscode')
  set scrolloff=0
  set sidescrolloff=0
  set nowrap
  set signcolumn=no
  set nolist
else
  set scrolloff=3
  set sidescrolloff=5
endif

" Text display settings
set formatoptions-=tcr
set textwidth=0  "120
set linebreak
set nowrap
set whichwrap+=h,l,<,>,[,]

" No annoying sound on errors
set noerrorbells
set belloff=all
set novisualbell

if exists('g:vscode')
  set clipboard=unnamed,unnamedplus
endif

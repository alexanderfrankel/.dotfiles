""
"" Base Config
""

" Use vim, no vi defaults
set nocompatible

" Show line numbers
set number

" Show relative line numbers
" set relativenumber

" Show line and column number
set ruler

" Set default encoding to UTF-8
set encoding=utf-8

" Unsaved buffers are put in the background
set hidden

" Set wildmenu enhanced command line completion
set wildmenu

" Do not show matching parens
set showmatch

" Allow the cursor to go in to 'invalid' places
"set virtualedit=all

" Turn off error bells
set noerrorbells visualbell t_vb=

" Do not wrap lines
set nowrap

" Smart line wrap
set linebreak

" Set tab to 2 spaces
set tabstop=2

" Set autoindent to 2 spaces
set shiftwidth=2

" Round indent to multiple of 'shiftwidth'
set shiftround

" Use spaces instead of tabs
set expandtab

" Allow backspace while in insert mode everywhere
set backspace=indent,eol,start

" Do not load pi_paren default plugin
"let loaded_matchparen = 1

" Highlight the curent line
" set cursorline

" Set column marker at max line length
set colorcolumn=80

" Turn on mouse mode
set mouse=a

"""
""" Backup and Swap Files
"""

" Do not create backup files
set nobackup

" Do not create backup files while editing
set nowritebackup

" Set backup file directory
set backupdir^=~/.vim/_backup//    " where to put backup files.

" Do not create swap files
set noswapfile

"Set swap file directory
set directory^=~/.vim/_temp//      " where to put swap files.


""
"" General Key Mappings
""

" Set ',' to leader key
let mapleader = ","

" Map esc esc to save current buffer
map <Esc><Esc> :w<CR>

" Scroll command line history previous
cnoremap <C-p> <Up>

" Scroll command line history next
cnoremap <C-n> <Down>

" Move line up
nnoremap <leader>mM :m .-2<CR>
vnoremap <leader>mM :m '<-2<CR>gv

" Move line down
nnoremap <leader>mm :m .+1<CR>
vnoremap <leader>mm :m '>+1<CR>gv

""
"" Colors
""

" Turn on syntax highlighting allowing local overrides
syntax enable

" Set dark background
set background=dark

" Set colorscheme
colorscheme torte

" Match parens highlight color
" highlight MatchParen ctermbg=darkgrey

" Cursor line highlight color
highlight CursorLine ctermbg=236

" Active status line color
highlight StatusLine ctermbg=white

" Inactive status line color
highlight StatusLineNC ctermbg=black

" Vertical split line color
highlight VertSplit ctermbg=NONE


""
"" System Clipboard
""

" Copy relative path to system clipboard
nnoremap <leader>cf :let @+=expand("%")<CR>

" Copy absolute path to system clipboard
nnoremap <leader>cF :let @+=expand("%:p")<CR>

" Copy file name path to system clipboard
nnoremap <leader>ct :let @+=expand("%:t")<CR>


"""
""" Filetype stuff
"""

" Enable filetype recognition
filetype on

" Enable filetype recognition in plugins
filetype plugin on

" Enable indentation based on filetype
filetype indent on


""
"" Status Line
""

" Always include status line
set laststatus=2

" Status line config
set statusline=\ %f\ %m\ %r\ %=\ [%v]\ [%l/%L]\ [%p%%]


""
"" Walking Around Windows
""

" Moving the cursor...
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>

" Closing the window...
noremap <silent> <leader>cc :close<CR>
noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <leader>cl :wincmd l<CR>:close<CR>

" Moving the window...
noremap <silent> <leader>ml <C-W>L
noremap <silent> <leader>mk <C-W>K
noremap <silent> <leader>mh <C-W>H
noremap <silent> <leader>mj <C-W>J

" Equal windows...
noremap <silent> <leader>= :wincmd =<CR>

" Open quickfix list widow...
noremap <silent> <leader>cw :cw <CR>

" Tabs
noremap <silent> <leader>L :tabnext<CR>
noremap <silent> <leader>H :tabprev<CR>
noremap <silent> <leader>tn :tabnew<CR>
noremap <silent> <leader>tc :tabclose<CR>
noremap <silent> <leader>tw :wincmd T<CR>

" Maximize / minimize windows
nnoremap <silent> <leader>+ <C-W>_ <C-W>\|
nnoremap <silent> <leader>- <C-W>1\|
nnoremap <silent> <leader>= <C-W>=

" Resizing panes
" noremap <silent> <leader>+ :wincmd +<CR>
" noremap <silent> <leader>- :wincmd -<CR>
" noremap <silent> <leader>< :wincmd <<CR>
" noremap <silent> <leader>> :wincmd ><CR>


""
"" Trailing Whitespace
""

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

" Match all trailing whitespace when opening a file
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" Match trailing whitespace except when typing at end of line
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Match all trailing whitespace after leaving insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Fix trailing whitespace
nnoremap <silent> ,fw :call FixTrailingWhitespace()<CR>
function! FixTrailingWhitespace()
  let l:save_cursor = getpos(".")
  silent! execute ':%s/\s\+$//'
  call setpos('.', l:save_cursor)
endfunction


""
"" Abbreviations
""

" iab bp binding.pry<esc>
" iab db debugger<esc>
" iab wtf puts "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
" iab fsl # frozen_string_literal: true<esc>
" iab cl console.log()<esc>


""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
nnoremap <C-l> :nohlsearch<CR>
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
nnoremap n nzz


""
"" Formatting
""

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Format JSON file
nmap =j :%!python -m json.tool<CR>


""
"" Enable Default Plugins
""
packadd! matchit


""
"" Netrw
""

let g:netrw_list_hide = '.*\.swp$,\.swo$,\.swm$,\.swn$,\.swj$,\.swk$,\.swl$,\.swi$,\.DS_Store$'  " Hide filetypes in explorer
let g:netrw_alto = 1                                                                             " Open hsplit below current using 'o'
let g:netrw_altv = 1                                                                             " Open vsplit right current using 'v'
let g:netrw_keepdir = 0                                                                          " Track browsing dir
let g:netrw_banner = 0                                                                           " Remove banner


"""
""" Ack
"""

" nnoremap ,a :Ag!
" let g:ag_prg="ag --case-sensitive --vimgrep"
" let g:ag_working_path_mode="r"


"""
""" fzf
"""

set rtp+=/opt/homebrew/opt/fzf


""
"" Play with this file
""

" Edit .vimrc
nnoremap <silent>,ev :e $MYVIMRC<CR>

" Source .vimrc
nnoremap <silent>,sv :so $MYVIMRC<CR>

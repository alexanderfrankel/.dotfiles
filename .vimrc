echo ">^.^<"

""
"" Base Config
""

" Use vim, no vi defaults
set nocompatible      " Use vim, no vi defaults

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
set noshowmatch

" Allow the cursor to go in to 'invalid' places
set virtualedit=all

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
let loaded_matchparen = 1

" Highlight the curent line
"set cursorline

" Set column marker at max line length
set colorcolumn=120


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
nnoremap ,mM :m .-2<CR>
vnoremap ,mM :m '<-2<CR>gv

" Move line down
nnoremap ,mm :m .+1<CR>
vnoremap ,mm :m '>+1<CR>gv


""
"" Colors
""

" Turn on syntax highlighting allowing local overrides
syntax enable

" Set dark background
set background=dark

" Set molokai colorscheme
"colorscheme molokai

" Set solarized colorscheme term
let g:solarized_termtrans=1

" Set solarized colorschem to 256 color
let g:solarized_termcolors=256

" Set solarized colorscheme
colorscheme solarized

" Match parens highlight color
highlight MatchParen ctermbg=darkgrey

" Cursor line highlight color
"highlight CursorLine  term=underline  guibg=#555555  ctermbg=236

" Active status line color
highlight StatusLine ctermfg=lightgrey ctermbg=black

" Inactive status line color
highlight StatusLineNC ctermfg=darkgrey ctermbg=white

highlight CursorLineNr ctermfg=252 ctermbg=240

""
"" System Clipboard
""

" Add unamed register to system clipboard
" set clipboard=unnamed

" Copy relative path to system clipboard
nnoremap ,cf :let @+=expand("%")<CR>

" Copy absolute path to system clipboard
nnoremap ,cF :let @+=expand("%:p")<CR>

" Copy file name path to system clipboard
nnoremap ,ct :let @+=expand("%:t")<CR>


"""
""" Filetype stuff
"""

" Enable filetype recognition
filetype on

" Enable filetype recognition in plugins
filetype plugin on

" Enable indentation based on filetype
filetype indent on

" Set filetype to slim when *.skim file is loaded
autocmd BufNewFile,BufRead *.skim set filetype=slim


""
"" Status Line
""

" Always include status line
set laststatus=2

" Status line config
set statusline=\ %f\ %m\ %r\ %=\ %{fugitive#statusline()}\ [%v]\ [%l/%L]\ [%p%%]


""
"" Walking Around Windows
""

" Moving the cursor...
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>

" Closing the window...
noremap <silent> ,cc :close<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>

" Moving the window...
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J

" Equal windows...
noremap <silent> ,= :wincmd =<CR>

" Open quickfix list widow...
noremap <silent> ,cw :cw <CR>

" Tabs
noremap <silent> ,L :tabnext<CR>
noremap <silent> ,H :tabprev<CR>
noremap <silent> ,tn :tabnew<CR>
noremap <silent> ,tc :tabclose<CR>
noremap <silent> ,tw :wincmd T<CR>


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

iab bp binding.pry<esc>
iab db debugger<esc>
iab wtf puts "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>


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
"" Netrw
""

let g:netrw_list_hide= '.*\.swp$,\.swo$,\.swm$,\.swn$,\.swj$,\.swk$,\.swl$,\.swi$'   " Hide filetypes in explorer
let g:netrw_alto = 1                                                                 " Open hsplit below current using 'o'
let g:netrw_altv = 1                                                                 " Open vsplit right current using 'v'
let g:netrw_keepdir = 0                                                              " Track browsing dir

""
"" Vim-Gist
""

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1


"""
""" Ack
"""

nnoremap ,a :Ag!
let g:ag_prg="ag --case-sensitive --vimgrep"
let g:ag_working_path_mode="r"


"""
""" Ctrl P
"""

let g:ctrlp_regexp = 1
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_show_hidden = 1
"let g:ctrlp_user_command = 'find %s -type f | grep -E "\.conf$|\.rb$|\.sh$|\.bash$|\.json$|\.coffee$|\.scss$|\.skim$|\.haml$|\.slim$"'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g "\.conf$|\.rb$|\.sh$|\.bash$|\.json$|\.coffee$|\.scss$|\.skim$|\.haml$|\.slim$|\.sass$|\.erb$|\.js$|\.yml$|Gemfile|\.rake$|\.sql$|\.arb$"'
"let g:ctrlp_use_caching = 0
let g:ctrlp_max_depth = 30
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1ri'
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_prompt_mappings = {
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'CreateNewFile()':      ['<c-y>']
\ }


""
"" Pathogen Config
""

execute pathogen#infect()
Helptags


""
"" Play with this file
""

" Edit .vimrc
nnoremap <silent>,ev :e $MYVIMRC<CR>

" Source .vimrc
nnoremap <silent>,sv :so $MYVIMRC<CR>

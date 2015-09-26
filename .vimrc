""
"" Base Config
""

" Set ',' to leader key
let mapleader = ","

" Use vim, no vi defaults
set nocompatible      " Use vim, no vi defaults

" Show line numbers
set number

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

" Use spaces instead of tabs
set expandtab

" Allow backspace while in insert mode everywhere
set backspace=indent,eol,start

" Do not load pi_paren default plugin
let loaded_matchparen = 1

" Highlight the curent line
"set cursorline

"""
""" Backup and Swap Files
"""

" Do not create backup files
"set nobackup

" Set backup file directory
set backupdir^=~/.vim/_backup//    " where to put backup files.

" Do not create swap files
"set noswapfile

"Set swap file directory
set directory^=~/.vim/_temp//      " where to put swap files.


""
"" Colors
""

" Turn on syntax highlighting allowing local overrides
syntax enable

" Set dark background
set background=dark

" Set molokai colorscheme
"colorscheme molokai

" Set solarized colorscheme
colorscheme solarized

" Set solarized colorschem to 256 color
" let g:solarized_termcolors=256

" Match parens highlight color
highlight MatchParen ctermbg=darkgrey

" Cursor line highlight color
"highlight CursorLine  term=underline  guibg=#555555  ctermbg=236

" Active status line text color
highlight StatusLine ctermbg=lightblue

" Inactive status line text color
highlight StatusLineNC ctermbg=lightred


""
"" System Clipboard
""

" Copy visual selectio to system clipboard
vmap <C-c> :w !pbcopy<CR><CR>

" Copy relative path to clipboard
nnoremap ,cf :let @+=expand("%")<CR>

" Copy absolute path to clipboard
nnoremap ,cF :let @+=expand("%:p")<CR>

" Copy file name path to clipboard
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
set statusline=%F\ [%n]\%{fugitive#statusline()}\ %m\ %r\%=%-8.(%l,%c%)\ [%l/%L]\ [%p%%]


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

" Maximizing and unmaximize the window
nnoremap ,o :call MaximizeToggle()<CR>
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction


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
"" Appending Closing Characters
""

" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}
" inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
"
" inoremap        (  ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap ((     (
" inoremap ()     ()
" inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"
" inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
" inoremap ''     '
" inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
" inoremap ""     "


""
"" Surround Quotes
""

" Surround word with double quotes
" nnoremap <silent> qw :call Quote('"')<CR>
"
" " Surround word with single quotes
" nnoremap <silent> qs :call Quote("'")<CR>
"
" " Unquote word
" nnoremap <silent> wq :call UnQuote()<CR>
"
" function! Quote(quote)
"   normal mz
"   execute 's/\(\k*\%#\k*\)/' . a:quote . '\1' . a:quote . '/'
"   normal `zl
" endfunction
"
" function! UnQuote()
"   normal mz
"   execute 's/["' . "'" . ']\(\k*\%#\k*\)[' . "'" . '"]/\1/'
"   normal `z
" endfunction"'")'"')"


""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
nnoremap <C-l> :nohlsearch<CR><C-l>
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
nnoremap n nzz


"
" NERDtree
"

"map ,n :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"let NERDTreeHijackNetrw=1


""
"" Netrw
""

let g:netrw_list_hide= '.*\.swp$,.*\.swo$,\~$,\.orig$'   " Hide filetypes in explorer
let g:netrw_alto = 1                            " Open hsplit below current using 'o'
let g:netrw_altv = 1                            " Open vsplit right current using 'v'
let g:netrw_keepdir = 0                         " Track browsing dir

""
"" Vim-Gist
""

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

"""
""" Ctrl P
"""

let g:ctrlp_regexp = 1
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_user_command = 'find %s -type f | grep -E "\.conf$|\.rb$|\.sh$|\.bash$|\.json$|\.coffee$|\.scss$|\.skim$"'
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


""
"" Play with this file
""

" Edit .vimrc
nmap <silent>,ev :e $MYVIMRC<CR>

" Source .vimrc
nmap <silent>,sv :so $MYVIMRC<CR>

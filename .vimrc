""
"" Pathogen Config
""

execute pathogen#infect()

""
"" Basic Setup
""

"set nobackup
"set backupdir=~/.vim/backup
"set noswapfile
"set directory=~/.vim/swap

let mapleader = ","

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set hidden            " Unsaved buffers are put in the background
set wildmenu          " Set wildmenu enhanced command line completion
"set showmatch         " Show matching parens
set noshowmatch
"set cursorline        " Highlight the current line
set linebreak

syntax enable         " Turn on syntax highlighting allowing local overrides
set background=dark
colorscheme solarized
"let g:solarized_termcolors=256
"colorscheme molokai
set noerrorbells visualbell t_vb=

" Allow the cursor to go in to 'invalid' places
set virtualedit=all

" copy relative path to clipboard
nnoremap ,cf :let @+=expand("%")<CR>
" copy absolute path to clipboard
nnoremap ,cF :let @+=expand("%:p")<CR>
" copy file name path to clipboard
nnoremap ,ct :let @+=expand("%:t")<CR>


filetype on
filetype plugin on
filetype indent on

let loaded_matchparen = 1
highlight MatchParen ctermbg=darkgrey
"highlight CursorLine  term=underline  guibg=#555555  ctermbg=236
highlight StatusLine ctermbg=lightblue
highlight StatusLineNC ctermbg=lightred



nmap <silent>,ev :e $MYVIMRC<CR>
nmap <silent>,sv :so $MYVIMRC<CR>

autocmd BufNewFile,BufRead *.skim set filetype=slim

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> ,d :b#\|bd #<CR>
nnoremap <silent> ,z :w\|:vsp\|:wincmd l\|:E<CR>
nnoremap <silent> ,x :w\|:split\|:wincmd l\|:E<CR>
vmap <C-c> :w !pbcopy<CR><CR>

nmap <silent>,p :b#<CR>

"" AG searching
let g:ackprg = 'ag --vimgrep'


""
"" Status Line
""

set laststatus=2      " Always include status line
set statusline=%F\ [%n]\%{fugitive#statusline()}\ %m\ %r\%=%-8.(%l,%c%)\ [%l/%L]\ [%p%%]


""
"" Walking Around Windows
""

" Moving the cursor...
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>

" Closing the window...
noremap <silent> ,cc :close<cr>
noremap <silent> ,cj :wincmd j<cr>:close<cr>
noremap <silent> ,ck :wincmd k<cr>:close<cr>
noremap <silent> ,ch :wincmd h<cr>:close<cr>
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Moving the window...
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J

" Maximizing and unmaximizing the window
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

" Equal windows...
noremap <silent> ,= :wincmd =<cr>

" Vertically split buffer...
command! -nargs=1 Vsb call VsbFunction(<f-args>)

function! VsbFunction (arg1)
  execute 'vert sb' a:arg1
endfunction


""
"" Whitespace
""

set nowrap                                                        " don't wrap lines
set tabstop=2                                                     " a tab is two spaces
set shiftwidth=2                                                  " an autoindent (with <<) is two spaces
set expandtab                                                     " use spaces, not tabs
set backspace=indent,eol,start                                    " backspace through everything in insert mode

" highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! s:FixWhitespace(line1,line2)
  let l:save_cursor = getpos(".")
  silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
  call setpos('.', l:save_cursor)
endfunction

command! -range=% Fixwhite call <SID>FixWhitespace(<line1>,<line2>)     " Run :Fixwhite to remove end of line white space


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
"" Surrounding Text With Quotes
""

nnoremap <silent> qw :call Quote('"')<CR>
nnoremap <silent> qs :call Quote("'")<CR>
nnoremap <silent> wq :call UnQuote()<CR>
function! Quote(quote)
  normal mz
  exe 's/\(\k*\%#\k*\)/' . a:quote . '\1' . a:quote . '/'
  normal `zl
endfunction

function! UnQuote()
  normal mz
  exe 's/["' . "'" . ']\(\k*\%#\k*\)[' . "'" . '"]/\1/'
  normal `z
endfunction"'")'"')"


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


""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.


"
" NERDtree
"

"map <Leader>n :NERDTreeToggle<CR>      " NERDtree keymapping
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

"""
""" Vim Rspec
"""


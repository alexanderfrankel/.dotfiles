""
"" Pathogen Config
""

execute pathogen#infect('plugins/{}')

""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set hidden            " Unsaved buffers are put in the background
set wildmenu          " Set wildmenu enhanced command line completion
set showmatch         " Show matching parens
set cursorline        " Highlight the current line

syntax enable         " Turn on syntax highlighting allowing local overrides
colorscheme molokai

filetype on
filetype plugin on
filetype indent on

highlight MatchParen ctermbg=darkgrey guibg=darkgrey
highlight CursorLine  term=underline  guibg=#555555  ctermbg=236

nmap <silent>,ev :e $MYVIMRC<CR>
nmap <silent>,sv :so $MYVIMRC<CR>


""
"" Status Line
""

set laststatus=2      " Always include status line
set statusline=%f\ [%n]\ %m\ %r\%=%-8.(%l,%c%)\ [%p%%]


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

" set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter


""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.


""
"" NERDtree Setup
""

" map <Leader>n :NERDTreeToggle<CR>      " NERDtree keymapping
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


""
"" Netrw Setup
""

let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$'   " Hide filetypes in explorer
let g:netrw_alto = 1                            " Open hsplit below current using 'o'
let g:netrw_altv = 1                            " Open vsplit right current using 'v'
let g:netrw_keepdir = 0                         " Track browsing dir



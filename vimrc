set nocompatible      " We're running Vim, not Vi!
filetype off           " Enable filetype detection

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my vundles
" Bundle 'wincent/Command-T'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
" Commands for vim-surround
" cs"' :: Replace double quotes with single
" cs'" :: Replace single with double quotes
" ds"  :: Strip leading and trailing double quotes
" ysiw' :: Add single quotes to the current word
" ysis' :: Add single quotes around current sentence.
" ysip' :: Add single quotes around current paragraph.
" ysiwr or ysiw] :: Add square brackets around current word without adding spaces.
"  The targets b, B, r, and a are aliases for ), }, ], and > 
" ysiw{ :: Add curly braces and a space around current word.
" ysip<p> :: Add <p> tags around current paragraph without indenting.
" ySip<p> :: Add <p> tags around current paragraph and indent.
" Visual (non line/block) mode:
" S{ :: Add curly braces plus an inside space around selection.
" Sb :: Add parentheses with no inside space around selection.
" Linewise Visual mode:
" S<p> :: Add <p> tags around selected line(s) and indent.
" Block visual mode:
" Sr :: Wrap selection within each line by [].
Bundle 'tpope/vim-repeat' 
" vim-repeat allows . to repeat changes to surrounding quotes
Bundle 'tpope/vim-abolish'
" Commands for vim-abolish
" crs: snake_case
" crm: MixedCase
" crc: camelCase
" cr-: dash-case
" cr.: dot.case
" cr<space>: space case
" crt: Title Case
" cru: UPPER_CASE
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
"Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-git'
"Bundle 'godlygeek/tabular'
Bundle 'matchit.zip'

Bundle 'vim-ruby/vim-ruby'
Bundle 'ecomba/vim-ruby-refactoring'
" See https://github.com/ecomba/vim-ruby-refactoring for commands and keymaps
" Main shortcut: :nnoremap <leader>rel  :RExtractLet<cr>
Bundle 'tomtom/tcomment_vim'
" Commands for tcomment_vim
" gcc :: Toggle comment for the curent line
" gc{motion} ::Toggle comments for motion
Bundle 'alboyadjian/vim-rubyhash'
" Commands for vim-rubyhash
" <leader>rt :: stringify keys with double quotes
" <leader>rs :: symbolize keys
" <leader>rq :: stringify keys with single quotes
" <leader>rr :: turns hash into new-style ruby hash
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-bufferline'
Bundle 'bling/vim-airline'
Bundle 'Yggdroot/indentLine'
" Bundle 'ngmy/vim-rubocop'
Bundle 'scrooloose/syntastic'
" Bundle 'vim-scripts/Align'
Bundle 'vim-ctrlspace/vim-ctrlspace'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'andrewradev/switch.vim'
call vundle#end()            " required

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on             " Enable syntax highlighting

set autoindent
set smartindent
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set title
set ruler
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set hidden
set number
set hlsearch
set history=1000
set autoread
set undolevels=1000

set backupdir=~/.tmp   
set directory=~/.tmp "don't clutter my dirs with swp and tmp files

set backspace=indent,eol,start
set pastetoggle=<F2>

" Status line
set laststatus=2
" Airline/Bufferline already handles the statusline for us.
" set statusline=
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " filename
" set statusline+=%h%m%r%w                     " status flags
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%=                           " right align remainder
" set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=%-14(%l,%c%V%)               " line, character
" set statusline+=%<%P                         " file position

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd BufWritePre *.rb :%s/\s\+$//e

function! <SID>StripTrailingWhitespaces()
let l = line(".")
let c = col(".")
%s/\s\+$//ge
call cursor(l, c)
endfunction

" autocmd FileType ruby,eruby,cucumber,javascript,html autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType ruby,cucumber,javascript,html,yaml,dockerfile autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

runtime! macros/matchit.vim

set ai 
set sw=2
set et

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

highlight StatusLine ctermfg=yellow

let mapleader = " "

" Display extra whitespace
" set listchars=trail:.,tab:>-
" set list
set t_Co=256
" colors
" colorscheme ir_black
set background=dark
colorscheme madeofcode
" colorscheme solarized
" colorscheme vibrantink

" When compiled with +clipboard, if clipboard=unnamed,  y, d, and p will
" use OS clipboard by default.  Without this set, use `"*y` to use os
" clipboard.
" set clipboard=unnamed

" copy to OS clipboard.
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>yy "*yy

" paste at end
nmap <leader>p $p
" paste at beginning
nmap <leader>P ^P 

nmap <Leader>rr <Plug>ReplaceWithRegisterLine 
nmap pp <Plug>ReplaceWithRegisterLine 
nmap <leader>f <Plug>ReplaceWithRegisterLine<esc>

" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:bufferline_echo = 0
let g:airline_theme = 'molokai'
" let g:airline_theme = 'solarized'
let g:airline_section_c = '%t'
" let g:airline_exclude_filetypes = ['qf']
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#bufferline#overwrite_variables = 0

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" go to next lint error
nmap <leader>n :lnext<cr>

" go to next search result
nmap <leader>c :cnext<cr>
" nnoremap <silent> <Plug>SaveCloseAndNextResult :w<cr>:bd<cr>:cnext<cr>:silent! call repeat#set("\<Plug>SaveCloseAndNextResult", v:count)<CR>
" nmap <Leader>.c <Plug>SaveCloseAndNextResult
" nmap <leader>.c .:w<cr>:bd<cr>:cnext<cr>
nmap <leader>. @@

set tags=./tags

let g:vimrubocop_config = '~/.rubocop.yml'

let g:vim_json_syntax_conceal = 0

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_options_as_arguments = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_eruby_ruby_quiet_messages =
  \ {'regex': 'possibly useless use of a variable in void context'}

let g:GPGPreferSign = 1
let g:GPGDefaultRecipients = ['adam@cassia.tech']
let g:GPGPossibleRecipients = [ 'kmorrison@vistahigherlearning.com', 'shoelscher@vistahigherlearning.com', 'dthompson@vistahigherlearning.com' ]

" clear highlighting
map <C-h> :nohl<CR>

" ctrl-s to save
map <C-s> <esc>:w<CR>

" in insert mode, ctrl-s to save and return to insert
imap <C-s> <esc>:w<CR>i

" faster way to get out of insert mode
imap ;; <esc>

" also works in visual mode
vmap ;; <esc>

" ctrl-n maps to :cn (next search result) 
" ctrl-p maps to :cp (prev search result)
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>

" Override Ctrl-p behaviour, send it to Ctrl-Space instead.
nmap <C-p> <C-Space>

" page up and page down with leader j/k 
nmap <Leader>j <PageDown>
nmap <Leader>k <PageUp>

" Go to matching brace.
nmap <Leader>m %
vmap <Leader>m %

" switch windows with <leader> w
nmap <leader>w <C-w><C-w>

nmap <leader>d :bdelete<CR>

" split vertically with <leader> v
" nmap <leader>v :vsplit<CR> <C-w><C-w>

" change double to single quotes
nmap <leader>' cs"'
nmap <leader>ds cs"'
" change single to double quotes
nmap <leader>" cs"'
nmap <leader>sd cs"'
" put square blackets around current single-quoted string
nmap <leader>sr ysa'r 
" put square blackets around current double-quoted string
nmap <leader>dr ysa"r 
" Single quote the current word
nmap <leader>ws ysiw'
" Double quote the current word
nmap <leader>wd ysiw'
" Put curly braces with space around the current word
nmap <leader>wB ysiw{

" Add single quotes around the selection.
vmap <leader>' S'
vmap <leader>s S'
" Add double quotes around the selection.
vmap <leader>" S"
vmap <leader>d S"
" Add curly braces with spaces around the current selection.
vmap <leader>B S{
" Add square brackets around the current selection.
vmap <leader>r Sr

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Edit another file in the same directory as the current file " uses
" expression to extract path from current file's path 
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

vnoremap <silent> <Leader>rs :call ToSymbolKeysLinewise()<CR>
vnoremap <silent> <Leader>rt :call ToStringKeysLinewise()<CR>
vnoremap <silent> <Leader>rr :call To19KeysLinewise()<CR>
vnoremap <silent> <Leader>rq :call ToSingleQuotedStringKeysLinewise()<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" leader o inserts blank line above without entering edit mode.
" leader O does the same below and moves cursor position to that line
nmap <silent><leader>o :set paste<CR>m`O<Esc>``:set nopaste<CR>
nmap <silent><leader>O o<Esc>

" Ctrl-J inserts a newline at current character, then leaves insert
" mode and returns to the original cursor position.
nnoremap <C-J> i<CR><Esc>k$

" in insert mode, ctrl-l to lint and return to insert
imap <C-l> <esc>:SyntasticCheck<CR>:Errors<CR>i 

" in normal mode, ctrl-l to lint
nmap <C-l> :SyntasticCheck<CR>:Errors<CR>

" Open the linting error list
map <leader>l :Errors<CR>

" Close the linting error list
map <leader>lc :lclose<CR>

" Jump to next linting error
map <leader>ln :lnext<CR>
" Jump to previous linting error
map <leader>lp :lprevious<CR>

" allow semicolon to serve as colon
" nnoremap ; :

" I accidentally type q: instead of :q all the time.  It's a pain
" in the ass.  This mapping does what I intented, rather than
" what I typed. If I want to do what q: normall does, I can go to
" command mode and use Ctrl-F.
nmap q: :q
 
" gr swaps word with next word
" gl swaps word with previous word
nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohl<CR>
nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohl<CR>

" better movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

nmap <silent> <leader>pe $p
nmap <silent> <leader>pb ^P

nmap <silent> <leader>e 79\|
vmap <silent> <leader>e 79\|

"new tab
"map <C-t> <esc>:tabnew<CR>

" run a single ruby test:
" map <Leader>o ?def <CR>:nohl<CR>w"zy$:!ruby -I"test" <C-r>% -n <C-r>z<CR>
" map <Leader>o :.Rake<CR>

" run a file of tests
" map <Leader>t :!ruby -I"test" -I"spec" %<CR>

" run spec in documentation mode
" map <Leader>rd :!bundle exec rspec % --format documentation<CR>

" run cucumber feature
" map <Leader>cc :!cucumber %<CR>
 
" split horizontall with <leader> s
" nmap <leader>v :vsplit<CR> <C-w><C-w>
" nmap <leader>s :split<CR> <C-w><C-w>

"map <Leader>s :split <C-R>=expand("%:p:h") .  '/'<CR>

" rails.vim stuff
" map <Leader>c :Rcontroller 
" map <Leader>d odebugger<cr>puts 'debugger'<esc>:w<cr>
" map <Leader>co :TComment<CR>
" map <Leader>vc :RVcontroller 
" map <Leader>sc :RScontroller 
" map <Leader>f :Rfunctional 
" map <Leader>vf :RVfunctional 
" map <Leader>m :Rmodel 
" map <Leader>vm :RVmodel 
" map <Leader>sm :RSmodel 
" map <Leader>u :Runittest 
" map <Leader>vu :RVunittest 
" map <Leader>su :RSunittest 
" map <Leader>vv :RVview 
" map <Leader>sv :RSview 
if exists("&colorcolumn")
  set colorcolumn=79
endif

" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
" Here's a little trick that uses terminal's bracketed paste mode to 
" automatically set/unset Vim's paste mode when you paste.
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

map <C-a> <Home>
cmap <C-a> <Home>
imap <C-a> <Home>
map <C-e> <End>
cmap <C-e> <End>
imap <C-e> <End>

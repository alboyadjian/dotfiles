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
Bundle 'tpope/vim-repeat' 
" vim-repeat allows . to repeat changes to surrounding quotes
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-git'
"Bundle 'godlygeek/tabular'
Bundle 'matchit.zip'
Bundle 'ecomba/vim-ruby-refactoring'
" See https://github.com/ecomba/vim-ruby-refactoring for commands and keymaps
" Main shortcut: :nnoremap <leader>rel  :RExtractLet<cr>
Bundle 'tomtom/tcomment_vim'
" Commands for tcomment_vim
" gcc :: Toggle comment for the curent line
" gc{motion} ::Toggle comments for motion
Bundle 'vhladama/vim-rubyhash'
" Commands for vim-rubyhash
" <leader>rt :: stringify keys with double quotes
" <leader>rs :: symbolize keys
" <leader>rq :: stringify keys with single quotes
" <leader>rr :: turns hash into new-style ruby hash
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-bufferline'
Bundle 'bling/vim-airline'
Bundle 'Yggdroot/indentLine'
Bundle 'ngmy/vim-rubocop'
Bundle 'scrooloose/syntastic'

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
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position


autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd BufWritePre *.rb :%s/\s\+$//e

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//ge
  call cursor(l, c)
endfunction

autocmd FileType ruby,eruby,cucumber,javascript,html autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

runtime! macros/matchit.vim

set ai 
set sw=2
set et

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

highlight StatusLine ctermfg=yellow

let mapleader = ","

" Display extra whitespace
" set listchars=trail:.,tab:>-
" set list
set t_Co=256
" colors
" colorscheme ir_black
set background=dark
colorscheme solarized
" colorscheme vibrantink

" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:bufferline_echo = 0
let g:airline_theme = 'solarized'
let g:airline_section_c = ''

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

set tags=./tags

let g:vimrubocop_config = '~/.rubocop.yml'

let g:vim_json_syntax_conceal = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']

" clear highlighting
map <C-h> :nohl<CR>

" ctrl-s to save
map <C-s> <esc>:w<CR>

" in insert mode, ctrl-s to save and return to insert
imap <C-s> <esc>:w<CR>i

" faster ways to get out of insert mode
imap ;; <esc>
imap ii <esc>

" also works in visual mode
vmap ;; <esc>

" ctrl-n maps to :cn (next search result) 
" ctrl-p maps to :cp (prev search result)
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>

" page up and page down with leader j/k 
nmap <Leader>j <PageDown>
nmap <Leader>k <PageUp>

" switch windows with <leader> w
nmap <leader>w <C-w><C-w>

nmap <leader>d :bdelete<CR>

" split vertically with <leader> v
" nmap <leader>v :vsplit<CR> <C-w><C-w>

" change double to single quotes
nmap <leader>' cs"'

" change single to double quotes
nmap <leader>" cs"'

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

" useful for closing syntastic location list
map <leader>l :lclose<CR>

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

" allow semicolon to serve as colon
nnoremap ; :

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

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
let g:solarized_termtrans=1

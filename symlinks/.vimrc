" ===================================================
" INITIALIZE
" ===================================================
set nocompatible
filetype off  
set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" File management, search, navigation
Plugin 'mileszs/ack.vim' 
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-scripts/zoomwintab.vim'
Plugin 'skwp/greplace.vim' " :Gsearch

" Vim UI/UX
Plugin 'bling/vim-airline'
Plugin 'reedes/vim-colors-pencil'
Plugin 'gcmt/taboo.vim'

" Syntax highlighting
Plugin 'scrooloose/syntastic'
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'

" Snippets & autocomplete
Plugin 'sirver/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'

" Formatters, selectors, accelerators
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Ruby/Rails
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'henrik/vim-ruby-runner'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'skalnik/vim-vroom'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'

" Dependencies & utilities
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'kana/vim-textobj-user'
Plugin 'tomtom/tlib_vim'

call vundle#end()

filetype plugin indent on

" ===================================================
" VISUALS
" ===================================================
syntax enable

" Colorscheme
set t_Co=256
set background=dark
colorscheme pencil
" Fix for pencil comments
hi Comment cterm=NONE ctermbg=00 ctermfg=08
" hi ColorColumn ctermbg=27

" Tab styles
hi TabLineFill ctermfg=08 ctermbg=08
hi TabLine ctermfg=13 ctermbg=08
hi TabLineSel ctermfg=02 ctermbg=00

" Interactive cursor
let &t_SI = "\<esc>]50;CursorShape=1\x7"
let &t_EI = "\<esc>]50;CursorShape=0\x7"

" For MacVim
if has("gui_running")
  colorscheme pencil
  set guifont=Monaco:h13
  set guioptions-=r
  set guioptions-=T
  set guioptions-=L
  set fuoptions=maxvert,maxhorz
  set columns=1000
  au GUIEnter * set fullscreen
endif

" ===================================================
" REMAPS
" ===================================================
let mapleader=","

" Movement
nnoremap j gj
nnoremap k gk
nnoremap <c-j> }
nnoremap <c-k> {
nnoremap <s-j> }
nnoremap <s-k> {
nnoremap <c-h> ^
nnoremap <c-l> $
vnoremap <c-h> ^
vnoremap <c-l> $

" Windows
nnoremap wl <c-w>l
nnoremap wh <c-w>h
nnoremap wj <c-w>j
nnoremap wk <c-w>k
nnoremap w= <c-w>=
nnoremap wL <c-w>L
nnoremap wH <c-w>H
nnoremap wJ <c-w>J
nnoremap wK <c-w>K
nnoremap wf <c-w>x
nnoremap wo :ZoomWinTabToggle<cr>

" Tabs
nnoremap t <esc>:tabnew<cr>
nnoremap T <esc><c-w>T
nnoremap { <esc>gT
nnoremap } <esc>gt

" File navigation, search, replace
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>s :Ack<space>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>* *:%s//

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep indent selected
vnoremap <s-l> >gv
vnoremap <s-h> <gv
vnoremap > >gv
vnoremap < <gv

" Make F1 useful
nmap <F1> <esc>
imap <F1> <esc>

" Convential select all
nnoremap <leader>a ggVG

" Change pwd to current file
nnoremap <leader>cd :lcd<space>%:p:h<cr>:pwd<cr>

" Open in pwd
cnoremap e<space><space> e <c-r>=expand('%:p:h') . '/'<cr>

" Copy & paste to clipboard
vnoremap <leader>y "*y
nnoremap <leader>p "*p

" Drag block up/down
vnoremap <s-j> :m'>+<cr>gv
vnoremap <s-k> :m-2<cr>gv

" Toggle line wrapping
nnoremap <leader>w :set wrap!<cr>
nnoremap <leader>i :set list!<cr>

" Toggle relative numbers in visual line mode
nnoremap <silent> v v:<c-u>set nonu rnu<cr>gv
nnoremap <silent> V V0:<c-u>set nonu rnu<cr>gv
nnoremap <silent> <c-v> <c-v>:<c-u>set nonu rnu<cr>gv
vnoremap <esc> <esc>:set nornu nu<cr>
autocmd CursorMoved * if mode() !~# "[vV\<c-v>]" | set nornu nu | endif

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" Tags
nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
nnoremap <c-\> <c-w>v<c-w>L<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>
nnoremap <leader>\ :tab split<CR>:exec("tag ".expand("<cword>"))<cr><c-e>`z:Pulse<cr>
nnoremap <silent> <leader>tt :!ctags -R . <cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Modify command line cursor movement
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Gundo
nnoremap <leader>G :GundoToggle<cr>

" Tabularize
vnoremap <leader>T :Tabularize /

" Buffergator fix
nnoremap [b :BuffergatorMruCyclePrev<cr>
nnoremap ]b :BuffergatorMruCycleNext<cr>

" ===================================================
" Settings
" ===================================================
" Searching
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set gdefault
set wildmenu
set wildmode=list:longest,full
set wildignore+=*/.tmp/*,*.so,*.swp,*.zip,*.git
set shellpipe=>

" Tabbing and indents
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set scrolloff=3
set softtabstop=2
set tabstop=8
set shiftround

" Formatting, layout, misc tweeks
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set autoread
set autowrite
set number
set ruler
set cursorline
set cursorcolumn
set visualbell
set showcmd
set laststatus=2
set showmode!
set wrap
set linebreak
let &showbreak = '↪ '
set listchars=tab:▸\ ,trail:·,eol:¬
" set splitright

" Makes things faster?
set notimeout
set ttimeout
set ttimeoutlen=10
set lazyredraw

" Better completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Backups, swapfiles, views
set backup
set noswapfile
set history=1000
set undofile
set undoreload=10000
set viewoptions=cursor,folds

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp/swap//
set viewdir=~/.vim/tmp/view//
set viminfo+=n$HOME/.vim/tmp/.viminfo 
set tags=./tmp/tags,./tags,tags

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
if !isdirectory(expand(&viewdir))
    call mkdir(expand(&viewdir), "p")
endif

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" ===================================================
" Filetype configs
" ===================================================

" Tabstops
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype gitcommit setlocal colorcolumn=80

" ===================================================
" PLUGINS
" ===================================================
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeBookmarksFile=expand("$HOME/.vim/tmp/NERDTreeBookmarks")

" Ctrlp
let g:ctrlp_match_window='order:ttb,max:30'
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_cache_dir='$HOME/.vim/tmp/cache/ctrlp'
let g:ctrlp_arg_map=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_switch_buffer = 0

" Ack
let g:ackhighlight=1

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled=0
let g:airline_theme='pencil'

" Buffergator
let g:buffergator_viewport_split_policy='B'
let g:buffergator_split_size=10

" Taboo
let g:taboo_tab_format=' %f '

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsEditSplit='vertical'

" Emmet
" Usage: <Ctrl>e,
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_prevkey='<c-e>p'

" RubyRunner
let g:RubyRunner_key = '<Leader>e'
let g:RubyRunner_keep_focus_key = '<Leader>E'
let g:RubyRunner_open_below = 1
let g:RubyRunner_window_size = 10

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint', 'jshint']

" Vroom
let g:vroom_clear_screen = 0
let g:vroom_use_binstubs = 1
let g:vroom_use_bundle_exec = 0

" Gsearch
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" JavaScript, JSX, CoffeeScript, etc.
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" ===================================================
" CUSTOM FUNCTIONS
" ===================================================

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg='ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command='ag %s --hidden -l --nocolor -g ""'
endif

" Sets Quickfix window height
au FileType qf call AdjustWindowHeight(3, 30)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Clear register
function! <SID>ClearRegisters()
  let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
  let i=0
  while (i<strlen(regs))
    exec 'let @'.regs[i].'=""'
    let i=i+1
  endwhile
endfunction
command! -nargs=0 ClearRegisters call <SID>ClearRegisters()

" Clear undo history
function! <SID>ForgetUndo()
  let old_undolevels = &undolevels
  set undolevels=-1
  exe "normal a \<BS>\<esc>"
  let &undolevels = old_undolevels
  unlet old_undolevels
endfunction
command! -nargs=0 ClearUndo call <SID>ForgetUndo()

" Auto close JavaScript brackets
augroup ft_javascript
  au!
  au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><tab>.<cr><esc>kA<bs>
augroup END

" Pulse Line - used to highlight matches when navigating ctags
function! s:Pulse()
  let current_window = winnr()
  windo set nocursorline
  execute current_window . 'wincmd w'
  setlocal cursorline

  redir => old_hi
  silent execute 'hi CursorLine'
  redir END
  let old_hi = split(old_hi, '\n')[0]
  let old_hi = substitute(old_hi, 'xxx', '', '')

  let steps = 9
  let width = 1
  let start = width
  let end = steps * width
  let color = 233

  for i in range(start, end, width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor
  for i in range(end, start, -1 * width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor

  execute 'hi ' . old_hi
endfunction
command! -nargs=0 Pulse call s:Pulse()

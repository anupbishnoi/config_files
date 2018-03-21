" TODO: complete documentation here

" TODO: features to add
" - scroll current cursor position to middle of page
" - find next instance of same word in file

" load vim modules
call pathogen#infect()
syntax enable

if has("autocmd")
  filetype plugin indent on
endif

let @/='SEARCH_TERM'
set hlsearch
set nocompatible
set expandtab
set nofoldenable
set showmode
set mouse=a
set hidden
set ttyfast
set undofile
set ignorecase
set smartcase
set gdefault
set showmatch
set nobackup
set noswapfile
set showcmd          " display incomplete commands
set incsearch        " do incremental searching
set autoread
"set relativenumber
set wildmenu
"set autowrite
"set autowriteall
set switchbuf=usetab
set backspace=indent,eol,start
set modelines=0 " turn off security exploit
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=80
set foldmethod=indent
set foldnestmax=10
set foldlevel=1
set laststatus=2
set encoding=utf-8
set scrolloff=3
"set virtualedit=all
set history=50       " keep 50 lines of command line history
set visualbell t_vb= " turn off both visual and audio bell
set t_Co=256
set number
set numberwidth=4
set wildmode=list:longest,list:full
set complete=.,w,b,u
set completeopt=longest,menu
set clipboard=unnamed
set guioptions=aAce
set guifont=Monaco:h18  " based on Monaco:h18
"set colorcolumn=80
"set transparency=2
set sessionoptions=curdir,buffers,tabpages,winsize
" set viminfo^=h

"nnoremap j gj
"nnoremap k gk
"nnoremap <c-tab> gt
"nnoremap <c-s-tab> gT
nnoremap K :bn<cr>
nnoremap J :bp<cr>
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
nnoremap Q :bp<cr>:bd #<cr>
"nnoremap Q :w<cr>:bd<cr>
nnoremap ql :bd #<cr>
nnoremap <space> :b #<cr>
nnoremap _ g;
nnoremap + g,
nnoremap ! @q
nnoremap F gf
nnoremap <c-f> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <tab> <c-w>w
nnoremap <esc> :noh<cr><esc>

nnoremap ; :
vnoremap ; :

let mapleader = ","
nnoremap <leader>qq <c-w>q
nnoremap <leader>> <c-w>999>

" substitute word under cursor
nnoremap <leader>sw :%s/\<<C-r><C-w>\>/

nnoremap <leader>jo J
nnoremap <leader>lv :source ~/.vimrc<cr>
nnoremap <leader>et :tabe <c-r>=expand("%:p:h") . "/" <cr>
nnoremap <leader>ef :e <c-r>=expand("%:p:h") . "/" <cr>
nnoremap <leader>vv V`]
nnoremap <leader>J :m+<cr>
nnoremap <leader>K :m-2<cr>
nnoremap <leader>} VdkkVp>>
vnoremap <leader>} dkkVp
nnoremap <leader>w :w<cr>
nnoremap <leader><cr> i<cr><esc>
nnoremap <leader>r :edit<cr>
" reverse lines
nnoremap <leader>R :g/^/m0<cr>
nnoremap <leader>F zR
nnoremap <leader>sh :split<cr>
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>C :lcd %:p:h<cr>
nnoremap <leader>vl v$h
nnoremap <leader>ls :ls<cr>:buffer 
nnoremap <leader>W :%s/\s\+$//<cr>:retab<cr>
nnoremap <leader>M :%s/<c-v><c-m>//<cr>
nnoremap <leader>s<space> :grep 
nnoremap <leader>mh :set nonumber<cr>
nnoremap <leader>ms :set number<cr>
nnoremap <leader>sp :set paste<cr>
nnoremap <leader>np :set nopaste<cr>
nnoremap <leader>fd :s/\(-\)\(\w\)/\U\2/g<cr>
nnoremap <leader>fq :s/\(: \)\(.\+\);/\1'\2',/g<cr>
nnoremap <leader>ti4 :set shiftwidth=4<cr>:set tabstop=4<cr>:set softtabstop=4<cr>
nnoremap <leader>ti2 :set shiftwidth=2<cr>:set tabstop=2<cr>:set softtabstop=2<cr>

nnoremap <leader>bgd :set bg=dark<cr>
nnoremap <leader>bgl :set bg=light<cr>

vnoremap <leader>s :s/
vnoremap <leader>jp :!python -mjson.tool<cr>
vnoremap <leader>fd :s/\(-\)\(\w\)/\U\2/g<cr>
vnoremap <leader>fq :s/\(: \)\(.\+\);/\1'\2',/g<cr>

" Deleting without copying
nnoremap <leader>d "_d
nnoremap <leader>x "_x
vnoremap <leader>d "_d
vnoremap <leader>x "_x

" Ack/grep results jumping
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>
nnoremap <leader>o :copen<cr>

" For MacVim
vnoremap <D-c> "+y
vnoremap <D-x> "+d
nnoremap <D-v> "+p

" Editing help
inoremap <leader>l <esc>$a
inoremap <leader>k <esc>O
inoremap <leader>dd <esc>ddk$
inoremap <leader>w <esc>:w<cr>
inoremap <leader>( (<esc>ea)<esc>%a
inoremap jj <esc>

" JSON Formatter
nnoremap <leader>jf :%!python -mjson.tool<cr>:%s/    /  /gg<cr>:w<cr>
vnoremap <leader>jf :!python -mjson.tool<cr>

" Press ^F from command mode to insert the current file name
cmap <c-f> <c-r>=expand("%:p")<cr>

" ## Plugins

" Elm
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>
nnoremap <leader>er :ElmRepl<CR>

if has("autocmd")
  " au BufWritePost *.elm ElmMakeFile("Main.elm")
endif


" CtrlP
let g:ctrlp_map = '<c-o>'
" From https://github.com/kien/ctrlp.vim/issues/174
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <leader>co :CtrlPClearAllCaches<cr>

" Multiple cursors
let g:multi_cursor_next_key='<c-p>'
let g:multi_cursor_prev_key='<c-y>'
let g:mlti_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<Esc>'
" let g:multi_cursor_start_key='<bslash>'

" Airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
if has("autocmd")
  au FileType vim let g:airline#extensions#whitespace#checks = [ 'indent' ]
endif

" indentLine
let g:indentLine_color_term = 7

" Tabular
nnoremap <leader>/: :Tabularize /^[^:]*\zs:/l0l1<cr>
nnoremap <leader>/: :Tabularize /=<cr>
"nnoremap <leader>/= :Tabularize /^[^=]*=/l0l1<cr>
nnoremap <leader>/, :Tabularize /^[^\,]*\zs\,/l0l1<cr>

" UltiSnips
" nnoremap <leader>sn :UltiSnipsEdit<cr>
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" GReplace
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Git
nnoremap <leader>g<space>  :w<cr>:Git
nnoremap <leader>gc :w<cr>:Gcommit<cr>
nnoremap <leader>gg :w<cr>:Git push<cr>
nnoremap <leader>gd :w<cr>:Gdiff<cr>
nnoremap <leader>gs :w<cr>:Gstatus<cr>
nnoremap <leader>ga :w<cr>:Git add <c-r>=expand("%:p")<cr><cr><cr>
nnoremap <leader>ge :Gedit HEAD<cr><cr><cr>
nnoremap <leader>gb :Gblame<cr>

" TagBar
nnoremap <leader>tb :TagbarToggle<cr>

" JSLint
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
" let g:syntastic_python_python_exec = 'python3'
nnoremap <leader>js :SyntasticCheck<cr>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" NERDTree and NERDCommenter
let g:NERDSpaceDelims = 1
nnoremap <leader>t :NERDTreeToggle<cr>
let NERDSpaceDelims=1

" Compile and open markdown as HTML
nnoremap <leader>md :Mm<cr>

" SuperTab
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabMidWordCompletion = 0
"let g:SuperTabMappingForward = '<tab>'
"let g:SuperTabMappingBackward = '<s-tab>'
"let g:SuperTabLongestHighlight = 1
"let g:SuperTabRetainCompletionDuration = 'insert'

" MRU - Most recently used files
nnoremap <leader>lf :MRU<cr>
let MRU_Max_Entries=50

" Linediff
" vnoremap 

" only write if needed and update the start time after the save
function! UpdateFile()
  if ((localtime() - b:start_time) >= 1)
    update
    let b:start_time=localtime()
  "else
    "echo "Only " . (localtime() - b:start_time) . " seconds have elapsed so far."
  endif
endfunction

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!
    "These write file when you leave insert mode
    "au InsertLeave * silent! :w
    "au CursorHold * silent! call UpdateFile()
    au BufRead,BufNewFile * let b:start_time=localtime()
    au BufWritePre * let b:start_time=localtime()

    au FileType helpfile nnoremap <buffer><cr> <c-[>  " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>  " Backspace to go back

    au! BufRead,BufNewFile *.cshtml     setfiletype html
    au! BufRead,BufNewFile *.es6        setfiletype javascript
    au! BufRead,BufNewFile *.haml       setfiletype haml
    au! BufRead,BufNewFile *.tmpl       setfiletype html

    " don't indent my html
    au FileType html setlocal indentexpr=|setlocal cindent

    au FileType htmlcheetah setlocal ft=html
    au FileType text setlocal textwidth=78
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    " don't show swap file crap, just open same file again as read-only
    " au SwapExists * let v:swapchoice = 'o'
    " au SwapExists * echomsg ErrorMsg
    " au SwapExists * echo 'Duplicate edit session (read-only)'
    " au SwapExists * echohl None

  augroup END
endif " has("autocmd")

source ~/.vimrc.local

set background=light
colorscheme solarized


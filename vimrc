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

set nocompatible
set expandtab
set nofoldenable
set showmode
"set hidden
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
set autowrite
set autowriteall
set switchbuf=usetab
set backspace=indent,eol,start
set modelines=0 " turn off security exploit
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set guifont=Monaco\ for\ Powerline:h18  " based on Monaco:h18
"set colorcolumn=80
"set transparency=2
set sessionoptions=curdir,buffers,tabpages,winsize

"nnoremap j gj
"nnoremap k gk
"nnoremap <c-tab> gt
"nnoremap <c-s-tab> gT
nnoremap K :bn<cr>
nnoremap J :bp<cr>
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
nnoremap Q :w<cr>:bd<cr>
nnoremap _ g;
nnoremap + g,
nnoremap @ @q

nnoremap <tab> <c-w>w

let mapleader = ","
nnoremap <leader>qq <c-w>q
nnoremap <leader>> <c-w>999>
nnoremap <leader>es :vsp<cr>

nnoremap <leader>jo J
nnoremap <leader>lv :source ~/.vimrc<cr>
nnoremap <leader>et :tabe <c-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>ef :e <c-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>vv V`]
nnoremap <leader>J :m+<cr>
nnoremap <leader>K :m-2<cr>
nnoremap <leader>} VdkkVp>>
vnoremap <leader>} dkkVp
nnoremap <leader>w :w<cr>
nnoremap <leader><cr> i<cr><esc>
nnoremap <leader>r :edit<cr>
nnoremap <leader>F zR
nnoremap <leader>sh :split<cr>
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>C :lcd %:p:h<cr>
nnoremap <leader>vl v$h
nnoremap <leader>ls :ls<cr>:buffer 
nnoremap <leader>oo :! open .<cr><cr>
nnoremap <leader>W :%s/\s\+$//<cr>
nnoremap <leader>M :%s/<c-v><c-m>//<cr>

vnoremap <leader>s :s/
vnoremap <leader>jp :!python -mjson.tool<cr>

" JS Beautifier
nnoremap <leader>jf :call JsBeautify()<cr>

" Ack/grep results jumping
nnoremap <c-n> :cn<cr>
nnoremap <c-p> :cp<cr>
nnoremap <c-o> :copen<cr>

" For MacVim
vnoremap <D-c> "+y
vnoremap <D-x> "+d
nnoremap <D-v> "+p

" Editing help
inoremap <leader>l <Esc>$a

" Press ^F from command mode to insert the current file name
cmap <c-f> <c-r>=expand("%:p")<cr>

" ## Plugins

" UltiSnips
nnoremap <D-e> :UltiSnipsEdit<cr>
nnoremap <leader>sn :UltiSnipsEdit<cr>

" Powerline status bar
let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'

" Git
nnoremap <leader>g  :w<cr>:Git
nnoremap <leader>gc :w<cr>:Gcommit<cr>
nnoremap <leader>gg :w<cr>:Git push<cr>
nnoremap <leader>gd :w<cr>:Gdiff<cr>
nnoremap <leader>gs :w<cr>:Gstatus<cr>
nnoremap <leader>ga :w<cr>:Git add .<cr>:Gcommit -m "
nnoremap <leader>ge :Gedit HEAD<cr><cr><cr>

" JSLint
nnoremap <leader>js :JSHint<cr>

" NERDTree and NERDCommenter
nnoremap <leader>nd :NERDTreeToggle<cr>

" Compile and open markdown as HTML
nnoremap <leader>md :Mm<cr>

" SuperTab
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabMidWordCompletion = 0
let g:SuperTabMappingForward = '<s-tab>' "'<tab>'
"let g:SuperTabMappingBackward = '<s-tab>'
"let g:SuperTabLongestHighlight = 1
"let g:SuperTabRetainCompletionDuration = 'insert'

" MRU - Most recently used files
nnoremap <leader>lf :MRU<cr>
let MRU_Max_Entries=50

" Use Ack instead of Grep when available
if executable("ack")
  "set grepprg=ack\ -H\ --ignore-dir=.meteor\ --ignore-dir=lib\ --ignore-di
  set grepprg=ack\ -H\ --sort-files\ --ignore-dir=node_modules\ --ignore-di
endif

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
    au InsertLeave * silent! :w
    au BufRead,BufNewFile * let b:start_time=localtime()
    au CursorHold * silent! call UpdateFile()
    au BufWritePre * let b:start_time=localtime()

    au FileType helpfile nnoremap <buffer><cr> <c-[>  " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>  " Backspace to go back

    au! BufRead,BufNewFile *.cshtml     setfiletype html
    au! BufRead,BufNewFile *.haml       setfiletype haml
    au! BufRead,BufNewFile *.tmpl       setfiletype html

    " don't indent my html
    au FileType html setlocal indentexpr=|setlocal cindent

    autocmd FileType htmlcheetah setlocal ft=html
    autocmd FileType text setlocal textwidth=78
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
    if has("unix")
      autocmd BufWritePost *
        \ if getline(1) =~ '^#!'     |
        \   if getline(1) =~ '/bin/' |
        \     !chmod u+x <afile>     |
        \   endif                    |
        \ endif
    endif
  augroup END
endif " has("autocmd")

set background=light
colorscheme solarized

source ~/.vimrc.local


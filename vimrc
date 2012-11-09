filetype plugin indent on
call pathogen#infect()
let $PATH=substitute(system("echo \$PATH"), "\r\*\n", "", "g")
syntax enable
let mapleader = ","

set nocompatible
set backspace=indent,eol,start
set modelines=0 " turn off security exploit
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set laststatus=2
set encoding=utf-8
set scrolloff=3
set showmode
"set hidden
"set virtualedit=all
set ttyfast
set undofile
set ignorecase
set smartcase
set gdefault
set showmatch
set nobackup
set history=50       " keep 50 lines of command line history
set showcmd          " display incomplete commands
set incsearch        " do incremental searching
set visualbell t_vb= " turn off both visual and audio bell
set t_Co=256
set autoread
set relativenumber
set numberwidth=4
set wildmode=list:longest,list:full
set wildmenu
set complete=.,w,b,u
set completeopt=longest,menu
set clipboard=unnamed
set autowrite
set visualbell t_vb=    " turn off both visual and audio bell
set guioptions=aAce
set guifont=Monaco\ for\ Powerline:h18  " based on Monaco:h18
"set colorcolumn=80
"set transparency=2

"nnoremap <tab> %
"vnoremap <tab> %
"nnoremap j gj
"nnoremap k gk
nnoremap <leader>jo J
nnoremap <D-j> J
nnoremap <c-tab> gt
nnoremap <c-s-tab> gT
nnoremap K :bn<cr>
nnoremap J :bp<cr>
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
nnoremap <tab> <c-w>w
nnoremap Q :w<cr>:bd<cr>
"nnoremap <leader>q <c-w>q
nnoremap <leader>q :bd<cr>
nnoremap _ g;
nnoremap + g,

nnoremap <leader>L :source .vimrc.local<cr>
nnoremap <leader>et :tabe <c-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>vv V`]
nnoremap <leader>J :m+<cr>
nnoremap <leader>jj yyp
nnoremap <leader>K :m-2<cr>
nnoremap <leader>kk yyP
nnoremap <leader>w :w<cr>
nnoremap <leader><cr> i<cr><esc>
nnoremap <leader>> <c-w>999>
nnoremap <leader>r :edit<cr>
nnoremap <leader>F zR
nnoremap <leader><leader> @q
nnoremap <leader>s<space> :grep 
nnoremap <leader>sh :split<cr>
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>C :lcd %:p:h<cr>
nnoremap <leader>vl v$h
nnoremap <leader>ls :ls<cr>:buffer 
nnoremap <leader>tt :grep \\#todo\:<cr><cr>
nnoremap <leader>tl :grep \\#todo\ later\:<cr><cr>
nnoremap <leader>mm :grep \\#mark<cr><cr>
nnoremap <leader>oo :! open .<cr><cr>

vnoremap <leader>s :s/

" For MacVim
vnoremap <D-c> "+y
vnoremap <D-x> "+d
nnoremap <D-v> "+p

" Editing help
"inoremap <leader><cr> <Esc>o
inoremap <leader>l <Esc>$a
inoremap <leader>f <Esc>$a -><cr>
inoremap <leader>g <Esc>$a, -><cr>
inoremap <leader>> <esc>$a -> 

" Press ^F from command mode to insert the current file name
cmap <c-f> <c-r>=expand("%:p")<cr>

" ## Plugins

" Tabular
nnoremap <leader>t<space> :Tabular /
vnoremap <leader>t<space> :Tabular /

" UltiSnips
nnoremap <D-e> :UltiSnipsEdit<cr>
nnoremap <leader>ej :UltiSnipsEdit<cr>

" JSLint
nnoremap <leader>jn :JSLintUpdate<cr>:cc<cr>
"nnoremap <leader>jc :JSLintToggle<cr>:JSLintUpdate<cr>:cc<cr>
let g:JSLintHighlightErrorLine = 0

" Powerline status bar
let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'

" Sparkup
let g:sparkupExecuteMapping = '<leader>hh'
let g:sparkupNextMapping = '<c-e>'

" Git
nnoremap <leader>g  :w<cr>:Git
nnoremap <leader>gc :w<cr>:Gcommit<cr>
nnoremap <leader>gg :w<cr>:Git push<cr>
nnoremap <leader>gd :w<cr>:Gdiff<cr>
nnoremap <leader>gs :w<cr>:Gstatus<cr>
nnoremap <leader>ga :w<cr>:Git add .<cr>:Gcommit -m "
nnoremap <leader>ge :Gedit HEAD<cr><cr><cr>

" Coffee
nnoremap <leader>js :CoffeeCompile watch vert<cr>
nnoremap <leader>jq <c-w>l:q<cr>
vnoremap <leader>js :CoffeeCompile<cr>
"nnoremap <leader>ch :CoffeeLint! \| cwindow<cr>
let coffee_make_options = '--bare'

" NERDTree and NERDCommenter
nnoremap <leader>nd :NERDTreeToggle<cr>

" Compile and open markdown as HTML
nnoremap <leader>md :Mm<cr>

" Ack/grep results jumping
nnoremap <c-n> :cn<cr>
nnoremap <c-p> :cp<cr>
nnoremap <c-o> :copen<cr>

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMidWordCompletion = 0
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
let g:SuperTabLongestHighlight = 1
let g:SuperTabRetainCompletionDuration = 'insert'

" MRU - Most recently used files
nnoremap <leader>lf :MRU<cr>
let MRU_Max_Entries=20
"let MRU_Exclude_Files='.*vimrc.*'

" More

" Use Ack instead of Grep when available
if executable("ack")
    "set grepprg=ack\ -H\ --ignore-dir=.meteor\ --ignore-dir=lib\ --ignore-dir=client/helpers/lib\ --ignore-dir=app/lib\ --ignore-dir=public\ --type-add\ js=.coffee\ --type-add\ html=.less\ --type-add\ html=.md
    set grepprg=ack\ -H\ --ignore-dir=.git\ --ignore-dir=_skytec\ --ignore-dir=frontend/js/lib\ --ignore-dir=poc\ --ignore-dir=frontend/docs\ --ignore-dir=frontend/css\ --type-add\ js=.coffee\ --type-add\ html=.less\ --type-add\ html=.md
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!
        au FocusLost * :wa
        autocmd FileType javascript setlocal fdm=expr 
        autocmd FileType javascript setlocal fde=getline(v:lnum)=~'^\\s*\\/\\/'?1:getline(prevnonblank(v:lnum))=~'^\\s*\\/\\/'?1:getline(nextnonblank(v:lnum))=~'^\\s*\\/\\/'?1:0
        if has("gui")
            autocmd FileType javascript hi Folded guifg=bg
        else
            autocmd FileType javascript hi Folded ctermfg=bg
        endif
        autocmd syntax javascript normal zM

        autocmd FileType javascript set omnifunc=
        au FileType helpfile nnoremap <buffer><cr> <c-[>  " Enter selects subject
        au FileType helpfile nnoremap <buffer><bs> <c-T>  " Backspace to go back

        au! BufRead,BufNewFile *.haml             setfiletype haml
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
                \ if getline(1) =~ '^#!'      |
                \     if getline(1) =~ '/bin/'|
                \         !chmod u+x <afile>  |
                \     endif                   |
                \ endif
        endif
        " Change to directory of opened file
        "autocmd BufEnter * lcd %:p:h
        "autocmd VimEnter * call LoadLocal()
    augroup END
endif " has("autocmd")

colorscheme solarized

source ~/.vimrc.local

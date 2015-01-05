call pathogen#infect()
let $PATH=substitute(system("echo \$PATH"), "\r\*\n", "", "g")
syntax enable
let mapleader = ","

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
set relativenumber
set wildmenu
set autowrite
set autowriteall
set switchbuf=usetab
set backspace=indent,eol,start
set modelines=0 " turn off security exploit
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

"nnoremap <tab> %
"vnoremap <tab> %
"nnoremap j gj
"nnoremap k gk
nnoremap <D-j> J
nnoremap <c-tab> gt
nnoremap <c-s-tab> gT
nnoremap K :bn<cr>
nnoremap J :bp<cr>
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
"nnoremap Q :b #<cr>:bd #<cr>
nnoremap Q :bd<cr>
nnoremap _ g;
nnoremap + g,
nnoremap @ @q

nnoremap <tab> <c-w>w
nnoremap <leader>qq :b #<cr>:bd #<cr>
nnoremap <leader>qw <c-w>q
nnoremap <leader>qp :bd#<cr>
nnoremap <leader>> <c-w>999>
nnoremap <leader>es :vsp<cr>

nnoremap <leader>jo J
"nnoremap <leader>q :b #<cr>:bd #<cr>
nnoremap <leader>L :source .vimrc.local<cr>
nnoremap <leader>et :tabe <c-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>vv V`]
nnoremap <leader>J :m+<cr>
nnoremap <leader>jj yyp
nnoremap <leader>K :m-2<cr>
nnoremap <leader>kk yyP
nnoremap <leader>} VdkkVp>>
vnoremap <leader>} dkkVp
nnoremap <leader>w :w<cr>
nnoremap <leader><cr> i<cr><esc>
nnoremap <leader>r :edit<cr>
nnoremap <leader>F zR
nnoremap <leader>s<space> :grep 
nnoremap <leader>sh :split<cr>
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>C :lcd %:p:h<cr>
nnoremap <leader>vl v$h
nnoremap <leader>ls :ls<cr>:buffer 
nnoremap <leader>tt :grep TODO\:<cr><cr>
nnoremap <leader>tl :grep TODO later\:<cr><cr>
nnoremap <leader>mm :grep MARK\:<cr><cr>
nnoremap <leader>oo :! open .<cr><cr>
nnoremap <leader>W :%s/\s\+$//<cr>
nnoremap <leader>M :%s/<c-v><c-m>//<cr>
nnoremap <leader>< f<
nnoremap <leader>> f>

vnoremap <leader>s :s/
vnoremap . :normal .<cr>
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
"inoremap <leader><cr> <Esc>o
inoremap <leader>l <Esc>$a

" Press ^F from command mode to insert the current file name
cmap <c-f> <c-r>=expand("%:p")<cr>

" ## Plugins

" Tabular
nnoremap <leader>t<space> :Tabularize /
vnoremap <leader>t<space> :Tabularize /
nnoremap <leader>t: :Tabularize /:\zs<cr>
vnoremap <leader>t: :Tabularize /:\zs<cr>
nnoremap <leader>t= :Tabularize /=<cr>
vnoremap <leader>t= :Tabularize /=<cr>

" UltiSnips
nnoremap <D-e> :UltiSnipsEdit<cr>
nnoremap <leader>sn :UltiSnipsEdit<cr>

" JSLint
nnoremap <leader>jh :JSHint<cr>

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

" Coffee
"nnoremap <leader>js :CoffeeCompile watch vert<cr>
"nnoremap <leader>jq <c-w>l:q<cr>
"vnoremap <leader>js :CoffeeCompile<cr>

"nnoremap <leader>ch :CoffeeLint! \| cwindow<cr>
"let coffee_make_options = '--bare'

" NERDTree and NERDCommenter
nnoremap <leader>nd :NERDTreeToggle<cr>

" Compile and open markdown as HTML
nnoremap <leader>md :Mm<cr>

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

" Use Ack instead of Grep when available
if executable("ack")
    "set grepprg=ack\ -H\ --ignore-dir=.meteor\ --ignore-dir=lib\ --ignore-dir=client/helpers/lib\ --ignore-dir=app/lib\ --ignore-dir=public\ --type-add\ js=.coffee\ --type-add\ html=.less\ --type-add\ html=.md
    set grepprg=ack\ -H\ --sort-files\ --ignore-dir=node_modules\ --ignore-dir=js/lib\ --ignore-dir=docs\ --ignore-dir=css\ --ignore-dir=dist\ --type-add\ js=.coffee\ --type-add\ html=.less\ --type-add\ html=.md
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

        au FileType html compiler html

        autocmd FileType javascript setlocal fdm=expr 
        autocmd FileType javascript setlocal fde=getline(v:lnum)=~'^\\s*\\/\\/'?1:getline(prevnonblank(v:lnum))=~'^\\s*\\/\\/'?1:getline(nextnonblank(v:lnum))=~'^\\s*\\/\\/'?1:0
        " to hide comments
        "autocmd syntax javascript normal zM

        au FileType helpfile nnoremap <buffer><cr> <c-[>  " Enter selects subject
        au FileType helpfile nnoremap <buffer><bs> <c-T>  " Backspace to go back

        au! BufRead,BufNewFile *.cshtml         setfiletype html
        au! BufRead,BufNewFile *.haml           setfiletype haml
        au! BufRead,BufNewFile *.tmpl           setfiletype html

        " don't indent my html
        au FileType html setlocal indentexpr=|setlocal cindent

        au FileType html setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
        "au FileType css  setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2

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

set background=light
colorscheme solarized

source ~/.vimrc.local

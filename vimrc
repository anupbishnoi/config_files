filetype plugin indent on
call pathogen#infect()
let $PATH=substitute(system("echo \$PATH"), "\r\*\n", "", "g")
syntax enable
let mapleader = ","

set nocompatible
set backspace=indent,eol,start
set modelines=0 " turn off security exploit
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set visualbell t_vb=    " turn off both visual and audio bell
set autoread
set relativenumber
set numberwidth=4
set wildmode=list:longest,list:full
set wildmenu
set complete=.,w,t
set autowrite
set visualbell t_vb=    " turn off both visual and audio bell
set guioptions=aAce
set guifont=Monaco:h18
"set transparency=2

"colorscheme vividchalk
colorscheme solarized

nnoremap <tab> %
"vnoremap <tab> %
nnoremap j gj
nnoremap k gk
nnoremap <c-h> <C-w>h
nnoremap <c-l> <C-w>l
nnoremap <c-tab> gt
nnoremap <c-s-tab> gT
nnoremap <tab> :bn<cr>
nnoremap <s-tab> :bp<cr>
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

nnoremap <leader>L :source .vimrc.local<cr>
nnoremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>es <C-w>v:e <C-r>=expand("%:p:h") . "/"<cr>
nnoremap <leader>vv V`]
nnoremap <leader>q :bd<cr>
nnoremap <leader>Q :bw<cr>
nnoremap <leader>J :m+<cr>
nnoremap <leader>jj yyp
nnoremap <leader>K :m-2<cr>
nnoremap <leader>kk yyP
nnoremap <leader>w :w<cr>
nnoremap <leader><cr> i<cr><esc>
nnoremap <leader>> <C-w>999>
nnoremap <leader>r :edit<cr>
nnoremap <leader>f za
nnoremap <leader>F zA
nnoremap <leader><leader> @q
nnoremap <leader>s<space> :grep 
nnoremap <leader>C :lcd %:p:h<cr>
nnoremap <leader>vl v$h
nnoremap <leader>v' F'lvf'h
nnoremap <leader>c' F'lvf'hc
nnoremap <leader>v" F"lvf"h
nnoremap <leader>c" F"lvf"hc
nnoremap <leader>ll $a 
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
cmap <C-f> <C-r>=expand("%:p")<cr>

" ## Plugins
" Git
nnoremap <leader>g :w<cr>:Git
nnoremap <leader>gc :w<cr>:Gcommit<cr>
nnoremap <leader>gg :w<cr>:Git push<cr>
nnoremap <leader>gs :w<cr>:Gstatus<cr>
nnoremap <leader>ga :w<cr>:Git add .<cr>:Gcommit -m "
nnoremap <leader>ge :Gedit HEAD<cr><cr><cr>
set statusline=%02n:%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Coffee
nnoremap <leader>js :CoffeeCompile watch vert<cr>
nnoremap <leader>jq <c-w>l:q<cr>
vnoremap <leader>js :CoffeeCompile<cr>
nnoremap <leader>ch :CoffeeLint! \| cwindow<cr>
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

" MRU - Most recently used files
nnoremap <leader>lf :MRU<cr>
let MRU_Max_Entries=20
let MRU_Exclude_Files='.*vimrc.*'

" More

" Use Ack instead of Grep when available
if executable("ack")
    set grepprg=ack\ -H\ --ignore-dir=.meteor\ --ignore-dir=lib\ --ignore-dir=client/helpers/lib\ --ignore-dir=app/lib\ --ignore-dir=public\ --type-add\ js=.coffee\ --type-add\ html=.less\ --type-add\ html=.md
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!
    au FocusLost * :wa
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    au FileType helpfile nnoremap <buffer><cr> <C-[>  " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <C-T>  " Backspace to go back

    au! BufRead,BufNewFile *.haml         setfiletype haml
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
                  \ if getline(1) =~ '^#!'    |
                  \   if getline(1) =~ '/bin/'|
                  \       !chmod u+x <afile>  |
                  \   endif                   |
                  \ endif
    endif
    " Change to directory of opened file
    "autocmd BufEnter * lcd %:p:h
    "autocmd VimEnter * call LoadLocal()
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

source ~/.vimrc.local

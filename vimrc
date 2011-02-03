" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

cd $HOME

" Load pathogen and all the bundles
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " Save on changing to another window
        "au FocusLost * :wa

        au FileType helpfile nnoremap <buffer><cr> <C-[>  " Enter selects subject
        au FileType helpfile nnoremap <buffer><bs> <C-T>  " Backspace to go back

        " For Haml
        au! BufRead,BufNewFile *.haml         setfiletype haml

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif

        "if has("unix")
            "autocmd BufWritePost *
                        "\ if getline(1) =~ '^#!'    |
                        "\   if getline(1) =~ '/bin/'|
                        "\       !chmod u+x <afile>  |
                        "\   endif                   |
                        "\ endif
        "endif

    augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Press ^F from command mode to insert the current file name
cmap <C-f> <C-r>=expand("%:p")<CR>

" don't allow backspacing over everything in insert mode
set backspace=indent,eol,start

" turn off security exploit
set modelines=0

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Always display the status line
set laststatus=2

set encoding=utf-8
set scrolloff=3
set showmode
set hidden
set ttyfast
set undofile
set ignorecase
set smartcase
set gdefault
set showmatch
set nobackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set visualbell t_vb=    " turn off both visual and audio bell

" Numbers
set relativenumber
set numberwidth=4

" Tab completion options
set wildmode=list:longest,list:full
set wildmenu
set complete=.,w,t

" <Space> is the leader character
let mapleader = " "

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap/ /\v
vnoremap/ /\v
nnoremap <tab> %
vnoremap <tab> %
nnoremap j gj
nnoremap k gk
nnoremap ; :
vnoremap ; :
inoremap jj <Esc>
nnoremap <C-h> <C-w>h<C-w>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l<C-w>
nnoremap JJ gT
nnoremap KK gt
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-v> "+p

nnoremap <leader>ft Vatzf
"nnoremap <leader>v V`]
nnoremap <leader>q<leader> :q<cr>
nnoremap <leader>qq :q!<cr>
nnoremap <leader>j<leader> yyp
nnoremap <leader>k<leader> yyP
nnoremap <leader>wq :wq<cr>
nnoremap <leader>w<leader> :w<cr>
nnoremap <leader>ww <C-w>v<C-w>l
vnoremap <leader>s<leader> :s/
nnoremap <leader>sh :sh<cr>
nnoremap <leader>rd ggg?G
nnoremap <leader><cr> i<cr><Esc>
nnoremap <leader>jj :m+<cr>
nnoremap <leader>kk :m-2<cr>
nnoremap <leader>.<leader> <C-w>999>

" open vimrc in a split window"
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> 

" update vimrc and bring into effect
nnoremap <leader>ew :w<cr>:source ~/.vimrc<cr>  

" also exit the vimrc file
nnoremap <leader>eq :w<cr>:source ~/.vimrc<cr>:q<cr>  

" remove all whitespace at the end of sentences"
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" sort CSS properties"
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e<leader> :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Maps autocomplete to tab
imap <Tab> <C-P>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" No Help, please
nmap <F1> <Esc>
imap <F1> <Esc>
map <F1> <Esc>

" Plugins
nmap <leader>ls :NERDTreeToggle<cr>
nmap <leader>g<space> :Git 
nmap <leader>gc :Git commit -m ""<left>
nmap <leader>gp :Git push github master<cr>
nmap <leader>gs :Git status<cr>
nmap <leader>ga :Git add <C-r>=expand("%:p")<cr><cr>:Git commit -m ""<left>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
    set hlsearch
endif

" set font and color scheme
if has("gui_running")
    set visualbell t_vb=    " turn off both visual and audio bell
    set guioptions=
    set guifont="Dejavu Sans Mono"\ 10
    "set lines=999
    "set columns=999

    colorscheme vividchalk
    highlight NonText guibg=#060606
    highlight Folded  guibg=#0A0A0A guifg=#9090D0
    highlight LineNr  guibg=#444444 guifg=#777777
    nnoremap <leader>gn :set guioptions=<cr>
    nnoremap <leader>gm :set guioptions+=m<cr>
else
    set background=dark
endif

" Local config
if filereadable(".vimrc.local")
    source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
    set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Edit the README_FOR_APP (makes :R commands work)
"map <Leader>R :e doc/README_FOR_APP<CR>

" Hide search highlighting
"map <Leader>l :set invhls <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
"cmap <C-P> <C-R>=expand("%:p:h") . '/' <CR>

" Snippets are activated by Shift+Tab
"let g:snippetsEmu_key = '<S-Tab>'

" Don't use Ex mode, use Q for formatting
"map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
"vmap P p :call setreg('"', getreg('0')) <CR>

" Display extra whitespace
"set list listchars=tab:»·,trail:·

" Edit routes
"command! Rroutes :e config/routes.rb
"command! RTroutes :tabe config/routes.rb

" Rails configuration
"autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
"autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
"autocmd User Rails map <Leader>p :Rstep 
"autocmd User Rails map <Leader>sp :RSstep 
"autocmd User Rails map <Leader>tp :RTstep 
"autocmd User Rails map <Leader>m :Rmodel 
"autocmd User Rails map <Leader>c :Rcontroller 
"autocmd User Rails map <Leader>v :Rview 
"autocmd User Rails map <Leader>u :Runittest 
"autocmd User Rails map <Leader>f :Rfunctionaltest 
"autocmd User Rails map <Leader>i :Rintegrationtest 
"autocmd User Rails map <Leader>h :Rhelper 
"autocmd User Rails map <Leader>tm :RTmodel 
"autocmd User Rails map <Leader>tc :RTcontroller 
"autocmd User Rails map <Leader>tv :RTview 
"autocmd User Rails map <Leader>tu :RTunittest 
"autocmd User Rails map <Leader>tf :RTfunctionaltest 
"autocmd User Rails map <Leader>ti :RTintegrationtest 
"autocmd User Rails map <Leader>sm :RSmodel 
"autocmd User Rails map <Leader>sc :RScontroller 
"autocmd User Rails map <Leader>sv :RSview 
"autocmd User Rails map <Leader>su :RSunittest 
"autocmd User Rails map <Leader>sf :RSfunctionaltest 
"autocmd User Rails map <Leader>si :RSintegrationtest 
"autocmd User Rails map <Leader>g :Rconfig 
"autocmd User Rails map <Leader>sg :RSconfig 
"autocmd User Rails map <Leader>tg :RTconfig 


" Tags
"let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Window navigation
"nmap <C-J> <C-W><C-J>
"nmap <C-K> <C-W><C-K>

" if has("folding")
" set foldenable
" set foldmethod=syntax
" set foldlevel=1
" set foldnestmax=2
" set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
" endif


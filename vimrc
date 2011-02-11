" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

cd $HOME

" Load pathogen and all the bundles
filetype off
" Generate help tags when new bundles are added
"call pathogen#helptags()
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

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Always display the status line
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
"set ruler		" show the cursor position all the time
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

map < <cr>
nnoremap/ /\v
vnoremap/ /\v
nnoremap <tab> %
vnoremap <tab> %
nnoremap j gj
nnoremap k gk
nnoremap ; :
vnoremap ; :
inoremap jj <Esc>
nnoremap <C-h> <C-w>h<C-w>999>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l<C-w>999>
nnoremap <c-tab> gT
nnoremap <c-s-tab> gt
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
vnoremap <leader>s<leader> :s/
nnoremap <leader>sh :sh<cr>
nnoremap <leader>rd ggg?G
nnoremap <leader><cr> i<cr><Esc>
nnoremap <leader>jj :m+<cr>
nnoremap <leader>kk :m-2<cr>
nnoremap <leader>.<leader> <C-w>999>

" open vimrc in a split window"
nnoremap <leader>ev <C-w>v:e ~/config_files/vimrc<cr> 

" update vimrc and bring into effect
nnoremap <leader>ew :w<cr>:source ~/config_files/vimrc<cr>  

" also exit the vimrc file
nnoremap <leader>eq :w<cr>:source ~/config_files/vimrc<cr>:q<cr>  

" remove all whitespace at the end of sentences"
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" sort CSS properties"
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
nmap <Leader>e<leader> :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>et
nmap <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Opens a split window
nnoremap <leader>es <C-w>v:e <C-r>=expand("%:p:h") . "/"<cr>

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
nmap <leader>ss :ScratchOpen<cr>
nmap <leader>ls :NERDTreeToggle<cr>
nmap <leader>g<space> :Git 
nmap <leader>gc :Gcommit<left>
nmap <leader>gp :Git push github master<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>ga :Git add <C-r>=expand("%:p")<cr><cr>:Git commit -m ""<left>
nmap <leader>gd :Gdiff<cr>
"qmap <leader>t<leader> :CommandT<cr>
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabMappingForward = '<c-space>'
"let g:SuperTabMappingBackward = '<s-c-space>'

" To explore all commits 
nmap <leader>ge :Gedit HEAD<cr><cr><cr>

" Status line has git information
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P " 

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
    colorscheme vividchalk
    highlight LineNr ctermfg=DarkGrey ctermbg=Black
endif

" Local config
if filereadable(".vimrc.local")
    source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
    set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

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


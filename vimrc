" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
filetype plugin indent on
set nocompatible

call pathogen#infect()
"call pathogen#runtime_append_all_bundles()

let $PATH=substitute(system("echo \$PATH"), "\r\*\n", "", "g")

cd ~/code/projects/vidyamandir

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " Save on changing to another window
        au FocusLost * :wa
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        au FileType helpfile nnoremap <buffer><cr> <C-[>  " Enter selects subject
        au FileType helpfile nnoremap <buffer><bs> <C-T>  " Backspace to go back

        " For Haml
        au! BufRead,BufNewFile *.haml         setfiletype haml

        " For Coffee
        "au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

        " For all text files set 'textwidth' to 78 characters.
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

    augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")




" Press ^F from command mode to insert the current file name
cmap <C-f> <C-r>=expand("%:p")<CR>

" backspacing in insert mode
set backspace=indent,eol,start

" turn off security exploit
set modelines=0

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=1

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
set autoread

" Numbers
set relativenumber
set numberwidth=4

" Tab completion options
set wildmode=list:longest,list:full
set wildmenu
set complete=.,w,t

syntax enable

let mapleader = ","

nnoremap <tab> %
"vnoremap <tab> %
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <c-tab> gt
nnoremap <c-s-tab> gT

nnoremap <leader>vv V`]
nnoremap <leader>qq :q!<cr>
nnoremap <leader>j<leader> :m+<cr>
nnoremap <leader>jj yyp
nnoremap <leader>k<leader> :m-2<cr>
nnoremap <leader>kk yyP
nnoremap <leader>w :w<cr>
vnoremap <leader>s :s/
nnoremap <leader><cr> i<cr><esc>
nnoremap <leader>> <C-w>999>
nnoremap <leader>r :edit<cr>
nnoremap <leader>f za
nnoremap <leader>F zA
nnoremap <leader><leader> @q
nnoremap <leader>s :grep 
nnoremap <leader>cd :lcd %:p:h<cr>
nnoremap <leader>vl v$h
nnoremap <leader>v' F'lvf'h
nnoremap <leader>c' F'lvf'hc
nnoremap <leader>v" F"lvf"h
nnoremap <leader>c" F"lvf"hc

" Editing help
inoremap <leader><cr> <Esc>o
inoremap <leader>l <Esc>$a
inoremap <leader>f <Esc>$a-><cr>
inoremap <leader>> <esc>$a-> 

" open vimrc in a split window"
nnoremap <leader>ev :tabe ~/config_files/vimrc<cr>

" update vimrc and bring into effect
nnoremap <leader>ew :w<cr>:source ~/config_files/vimrc<cr>

" also exit the vimrc file
nnoremap <leader>eq :w<cr>:source ~/config_files/vimrc<cr>:q<cr>

" Opens an edit command with the path of the current file filled in
" Normal mode: <Leader>e
"nmap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the current file filled in
" Normal mode: <Leader>et
nmap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Opens a split window
nnoremap <leader>es <C-w>v:e <C-r>=expand("%:p:h") . "/"<cr>

" No Help, please
map <F1> <Esc>

" ## Plugins
" Git
nmap <leader>g :Git
nmap <leader>gc :Gcommit<cr>
nmap <leader>gg :Git push<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>ga :Git add .<cr>:Git commit<cr>
nmap <leader>ge :Gedit HEAD<cr><cr><cr>

" Coffee
nmap <leader>js :CoffeeCompile watch vert<cr>
nmap <leader>jq <c-w>l:q<cr>
vmap <leader>js :CoffeeCompile<cr>
nmap <leader>ch :CoffeeLint! \| cwindow<cr>

" NERDTree and NERDCommenter
nmap <leader>ls :NERDTreeToggle<cr>
vmap <leader>c<leader> <leader>c<space>
nmap <leader>c<leader> <leader>c<space>

" Compile and open markdown as HTML
nmap <leader>md :Mm<cr>

" Ack/grep results jumping
nmap <c-n> :cn<cr>
nmap <c-p> :cp<cr>
nmap <c-o> :copen<cr>

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMidWordCompletion = 0


let coffee_make_options = '--bare'

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
    "colorscheme vividchalk
    colorscheme solarized
    "set transparency=2
    set visualbell t_vb=    " turn off both visual and audio bell
    set guioptions=aAce
    set guifont=Monaco:h18
else
    "colorscheme vividchalk
    set background=dark
    colorscheme solarized
endif

" Local config
if filereadable(".vimrc.local")
    source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
    set grepprg=ack\ -H\ --ignore-dir=lib\ --ignore-dir=.meteor\ --type-add\ js=.coffee
endif

" Session management
nmap QQ <Esc>:mksession! ~/code/code_session.vis<cr>:wqa<cr>
function! RestoreSession()
  if argc() == 0 "vim called without arguments"
    execute 'source ~/code/code_session.vis'
  end
endfunction
autocmd VimEnter * call RestoreSession()

" For MacVim
vnoremap <D-c> "+y
vnoremap <D-x> "+d
nnoremap <D-v> "+p


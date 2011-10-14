" No audible bell
"set vb

" Start maximized
"set lines=999
"set columns=999


" No toolbar
"set guioptions-=T

" No menu
"set guioptions-=m

" No scrollbars
"set guioptions-=l
"set guioptions-=r
"set guioptions-=b

" Use console dialogs
"set guioptions+=c

" No GUI
"set guioptions=

" Turn off both visual and audio bell
set visualbell t_vb=   

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

" save sessions with .vis extension
nmap QQ :mksession!  ~/code/code_session.vis<CR>:wqa<CR>
" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %"
"autocmd VimEnter * call RestoreSession()

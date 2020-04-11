" Indentation
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal smarttab
setlocal autoindent
setlocal smartindent
setlocal cindent

" Mappings
inoremap {<CR> {<CR>}<Esc>ko

" inoremap ( ()<Esc>:let leavechar=")"<CR>i
" inoremap [ []<Esc>:let leavechar="]"<CR>i

" imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a

" inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

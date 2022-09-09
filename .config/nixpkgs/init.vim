set nu
set sw=2
set ts=2
set expandtab
set mouse=a

map <D-t> :tabnew<CR>
map <D-w> :tabclose<CR>
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
vmap <D-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <D-v> :call setreg("\"",system("pbpaste"))<CR>p
imap <D-v> :call setreg("\"",system("pbpaste"))<CR>p

set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'

function! OnTabEnter(path)
  if isdirectory(a:path)
    let dirname = a:path
  else
    let dirname = fnamemodify(a:path, ":h")
  endif
  execute "tcd ". dirname
endfunction

autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))

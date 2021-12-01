set autowrite                  " Automatically save before commands like :next and :make.
set ignorecase
set incsearch
set hlsearch
set modeline
set modelines=2
set nostartofline
set shortmess=atI
set showcmd                    " Show (partial) command in status line.
set showmatch                  " Show matching brackets.
set tags+=tags;/,tmp/tags
set visualbell t_vb=           " turn off error beep/flash
set whichwrap=b,s,h,l,<,>,[,]  " move freely between files
set clipboard=unnamed
set diffopt+=iwhite
set tabstop=2
set shiftwidth=2

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
noremap <Leader>a :Ack --ignore-dir log --ignore-dir tmp 
noremap <Leader>A :Ack --ignore-dir log --ignore-dir tmp --ignore node_modules 
noremap <Leader>l :TagbarToggle<CR>
noremap <Leader>; :NERDTreeToggle<CR>
noremap <Leader>c :!cat % \| pbcopy<CR>
noremap <Leader>g :!align.pl -ss<CR>dd
noremap <Leader>s :!sort<CR>
noremap <leader>tf :TestFile -strategy=neomake<CR>
noremap <leader>ts :TestSuite -strategy=neomake<CR>
noremap <leader>tn :TestNearest -strategy=neomake<CR>
noremap <C-p> :tabnext<cr>
noremap <C-o> :tabprev<cr>
noremap <C-n> :tabnew<cr>
noremap <C-q> :tabclose<cr>

if has("autocmd")
  " Filetypes (au = autocmd)
  au FileType help set nonumber|        " no line numbers when viewing help
  au FileType help set whichwrap=""|    " no line numbers when viewing help
  au FileType help nnoremap <buffer> <cr> <c-]>|   " Enter selects subject
  au FileType help nnoremap <buffer> <bs> <c-T>|   " Backspace to go back

  au FileType typescript,jenkinsfile,groovy,ruby,haml,sass,html,css,coffee,dockerfile,javascript,json,java,sh,bash,sql set expandtab
  au FileType json noremap <leader>j :%!python -m json.tool<cr>:%s/    /  /g<cr>

endif

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y\ 
set statusline+=%{FugitiveStatusline()}\ 
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}  " highlight
set statusline+=%b,0x%-8B                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


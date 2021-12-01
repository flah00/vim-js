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

  au FileType smarty,html,css map <buffer> <F3> :!tidy "%"<cr>
  au FileType jenkinsfile,groovy,ruby,haml,sass,html,css,coffee,dockerfile,javascript,json,java,sh,bash,sql set expandtab
  au FileType json noremap <leader>j :%!python -m json.tool<cr>:%s/    /  /g<cr>
  au FileType ruby,erb noremap <leader>r :!ruby -c %<cr>

  autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
        \ pathogen#split(&tags) +
        \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
endif

if $VIM_CRONTAB == 'true'
  set nobackup
  set nowritebackup
endif

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y\ 
set statusline+=%{FugitiveStatusline()}\ 
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}  " highlight
set statusline+=%b,0x%-8B                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" let g:html_use_css = 0
" let g:html_use_xhtml = 1
" let g:html_ignore_folding = 1
" let g:html_dynamic_folds = 1
let g:html_number_lines = 0

let g:ctrlp_map = '<c-i>'
let g:ctrlp_follow_symlinks = 1
let g:go_fmt_command = "goimports"

" solarized8
" The following options are inherited from Solarized:
" g:solarized_visibility: one of "normal" (default), "low", "high";
" g:solarized_diffmode: one of "normal" (default), "low", "high", "bold";
" g:solarized_termtrans: make terminal background transparent if set to 1 (default: 0).
" The following options were not available in the original Solarized:
" 
" g:solarized_statusline: one of "normal" (default) or "low";
" g:solarized_term_italics: set to 1 to enable italics in the terminal (default is 0).
" g:solarized_old_cursor_style: set to 1 if you want to use the original Solarized's cursor style (default: 0). By default, the cursor is orange/red in light themes, and blue in dark themes (but please note that your terminal may override the cursor's color).
" g:solarized_extra_hi_groups: set to 1 to enable Solarized filetype-specific syntax highlighting groups (default is 0). Please be aware that there is a long standing issue with extra highlight groups.
" g:solarized_use16: see above.


colorscheme solarized

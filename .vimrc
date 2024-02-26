"----------------------------------------------------------------------------
"vim global setting
"change working dir to the dir of the current file and pwd
nnoremap <leader>w :cd %:p:h<CR>:pwd<CR>
"turn on spell check for the local buffer
nnoremap <F3> :setlocal spell spelllang=en_us<CR>
"search for visually selected text by <leader>/
vnoremap <leader>/ y/\V<C-R>=escape(@",'/\')<CR><CR>
"set no highlight until next search
nnoremap <silent> <F2> :noh<CR>
"convenient copy and paste
vnoremap <C-c> "+y
nnoremap <C-v> "+p
set nu
"----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

call plug#end()
"----------------------------------------------------------------------------
"Vim backup file setting
"disable swap files
set noswapfile
"put al three types of backup files in one directory ~/.vimdata
let &directory = expand('~/.vimdata/swap//')

set backup
let &backupdir = expand('~/.vimdata/backup//')

set undofile
let &undodir = expand('~/.vimdata/undo//')

if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif
"----------------------------------------------------------------------------
"nerdtree setting
"automatically open nerdtree
"autocmd vimenter * NERDTree
"close vim when the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"toggle nerdtree
nmap <C-n> :NERDTreeToggle<CR>
"----------------------------------------------------------------------------
"gruvbox color scheme setting
"let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark
"----------------------------------------------------------------------------
"vim-airline setting
"show buffer info at the top as a tab line
let g:airline#extensions#tabline#enabled = 1
"powerline fonts
"let g:airline_powerline_fonts=1
"airline theme
let g:airline_theme='base16_gruvbox_dark_hard'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
"----------------------------------------------------------------------------
"vim-gitgutter
set updatetime=250
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
"let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
set signcolumn=yes
let g:gitgutter_set_sign_backgrounds = 1
"-------------------------------------------------------------------------------


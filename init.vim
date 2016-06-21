set encoding=utf-8
syntax on
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set listchars=tab:▸\ ,trail:⋅,nbsp:⋅,eol:¬
set cursorline
set showmatch
set showbreak=↪
set number
set relativenumber
set showcmd             " Show (partial) command in status line.
set showmode            " Show current mode.
set formatoptions+=o    " Continue comment marker in new lines.
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

"Use ; for commands.
nnoremap ; :
" Use Q to execute default register.
nnoremap Q @q

" Map the leader key to SPACE
let mapleader="\<SPACE>"

let g:python_host_prog='/usr/bin/python2'
let python_highlight_all=1

filetype plugin indent on
au FileType py set textwidth=100
au FileType py set smartindent
au FileType py set autoindent

call plug#begin('~/.nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'taglist.vim'
Plug 'blerins/flattown'
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'python.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
" Plug 'nvie/vim-flake8'
Plug 'scrooloose/syntastic'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

map <F3> :NERDTreeToggle<CR>

set background=dark
au FileType python IndentGuidesEnable
au FileType python let indent_guides_auto_colors = 0
au FileType python autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black guifg=black ctermfg=black ctermbg=black
au FileType python autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey guifg=darkgrey ctermfg=darkgrey ctermbg=darkgrey
au FileType python let indent_guides_color_change_percent = 10
au FileType python let indent_guides_guide_size = 1


" Airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
" let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ' '
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = '|'
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_theme= 'serene'

" Flake8 settings
let g:flake8_show_in_gutter = 1
let g:flake8_show_in_file = 1
let g:flake8_show_quickfix=0

" Syntastic Settings
let g:syntastic_python_python_exec = '/usr/bin/python2'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=has('ballon_eval')
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_ignore_files = ['^/usr/', '*node_modules*', '*vendor*', '*build*', '*LOCAL*', '*BASE', '*REMOTE*']
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_json_checkers=['jsonlint', 'jsonval']
let g:syntastic_ruby_checkers=['rubocop','mri']
let g:syntastic_perl_checkers=['perl','perlcritic','podchecker']
let g:syntastic_python_checkers=['pep8','python']
let g:syntastic_cpp_checkers=['gcc','cppcheck','cpplint','ycm','clang_tidy','clang_check']
let g:syntastic_c_checkers=['gcc','make','cppcheck','clang_tidy','clang_check']
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_html_checkers=['jshint']
let g:syntastic_yaml_checkers=['jsyaml']
let g:syntastic_sh_checkers=['sh','shellcheck','checkbashisms']
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_enable_perl_checker=1
let g:syntastic_c_clang_tidy_sort=1
let g:syntastic_c_clang_check_sort=1
let g:syntastic_c_remove_include_errors=1
let g:syntastic_quiet_messages = { "level": "[]", "file": ['*_LOCAL_*', '*_BASE_*', '*_REMOTE_*']  }
let g:syntastic_stl_format = '[%E{E: %fe #%e}%B{, }%W{W: %fw #%w}]'
let g:syntastic_java_javac_options="-g:none -source 8 -Xmaxerrs 5 -Xmaswarns 5"
let g:syntastic_python_flake8_args='--ignore=E1608,R0201,W1627,E1601,E1603,E1602,E1605,E1604,E1607,E1606,W1621,W1620,W1623,W1622,W1625,W1624,W1609,W1608,W1607,W1606,W1605,W1604,W1603,W1602,W1601,R0915,R0914,W1639,R0911,R0913,R0912,W1640,I0021,R0401,R0801,C0111,W1638,I0020,C0103,W1618,W1619,W1630,W1626,W1637,W1634,W1635,W1610,W1611,W1612,W1613,W1614,W1615,W1616,W1617,W1632,R0904,R0902,R0903,W1633,W0704,R0901,R0923,W1628,W1629,W1636,C0330,E301,E303,E309,E501,C0301,W0142,W0402,E1102,C1001,W0223,W0232,W0201,E1103'




" after write run flake8
" autocmd BufRead,BufWritePost *.py call Flake8()

" Syntax for multiple tag files are
" set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.nvim/tags/

" TagList Plugin Configuration
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
map <F7> :TlistToggle<CR>

" Viewport Controls
" ie moving between split panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme flattown

" " display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×,eol:¬
"
" " convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileType python,java autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileType python,java autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FileType python,java autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd FileType python,java autocmd BufWritePre     * :call TrimWhiteSpace()


" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" clear serach highlighting
nnoremap <Leader>c :nohlsearch<CR>

" Git commits.
autocmd FileType gitcommit setlocal spell

" Subversion commits.
autocmd FileType svn       setlocal spell

" Mercurial commits.
autocmd FileType asciidoc  setlocal spell


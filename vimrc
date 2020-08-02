" Terminal build: Tilda terminal emulator
" Tilda color pallete: base16:
" Link: https://github.com/Gwyki/base16-tilda
" Shell: zsh (oh-my-zsh with zsh-autosuggestions plugin)
syntax on
filetype plugin indent on


set hidden
set noerrorbells visualbell t_vb=

" No ringing
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

if has('nvim')
    set nohlsearch!
endif

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set rnu
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
"
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'alx741/vim-rustfmt'
Plugin 'dense-analysis/ale'
Plugin 'rust-lang/rust.vim'
"Plugin 'jaspervdj/stylish-haskell'
Plugin 'chrisdone/hindent'
Plugin 'urso/haskell_syntax.vim'
"Plugin 'neovimhaskell/haskell-vim'
" For the low bar
Plugin 'vim-airline/vim-airline'
" Repo with a shit ton of colorschemes
" Link : https://github.com/rafi/awesome-vim-colorschemes
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'artanikin/vim-synthwave84'
" Monokai theme
Plugin 'sickill/vim-monokai'
" Palenight theme
Plugin 'drewtempelmeyer/palenight.vim'

Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jremmen/vim-ripgrep'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-utils/vim-man'
Plugin 'lyuts/vim-rtags'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
call vundle#end() 


colorscheme gruvbox 
syntax on
set background=dark

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

"let g:haskell_enable_quantification = 1   
"let g:haskell_enable_recursivedo = 1      
"let g:haskell_enable_arrowsyntax = 1      
"let g:haskell_enable_pattern_synonyms = 1 
"let g:haskell_enable_typeroles = 1        
"let g:haskell_enable_static_pointers = 1  
"let g:haskell_backpack = 1                

let g:termguicolors=256
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25



let g:ctrlp_use_caching = 0


" Enter to add new line, brackets to look for brackets
map <Enter> o<ESC>
nnoremap  <leader>{ /{<ESC>
nnoremap  <leader>} /}<ESC>

nnoremap <leader>[ /[<ESC>
nnoremap <leader>] /]<ESC>
nnoremap <leader>( /(<ESC>
nnoremap <leader>) /)<ESC>

" Open new window on right and then open a NERDTree window
nnoremap <leader>vs :vsplit<ESC>:wincmd l<CR>:NERDTree<CR>

nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>al :ALEToggle<CR>
nnoremap <leader>nd :NERDTree<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <C-p> "+p<CR>
 

fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! RsPrintln()
    nnoremap <buffer> <leader>p iprintln!("{}", );<ESC>
endfun

fun! RustFmt()
    nnoremap <leader>rs :Rustfmt<ESC>
endfun

fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nnoremap <buffer> <leader>cr :CocRestart
endfun


autocmd FileType typescript :call GoYCM()

autocmd FileType cpp,cxx,h,hpp,c :call GoYCM()

autocmd FileType javascript :call GoYCM()
autocmd FileType javascript :colorscheme palenight 
autocmd FileType javascript :syntax on


autocmd FileType rust :colorscheme Atelier_CaveDark
autocmd FileType rust :call GoYCM()
autocmd FileType rust :call RsPrintln()
autocmd FileType rust :call RustFmt()

autocmd FileType html :colorscheme palenight 
autocmd FileType html :syntax on

autocmd FileType haskell :syntax on
autocmd FileType haskell :colorscheme molokai

" Gruvbox for C/C++ files
"autocmd FileType cpp,cxx,h,hpp,c :colorscheme gruvbox

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:rustfmt_on_save = 0

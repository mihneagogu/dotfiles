" Tilda color pallete: base16:
" Link: https://github.com/Gwyki/base16-tilda
syntax on
filetype plugin indent on

" If backspace doesn't work for some reason
set backspace=indent,eol,start

set hidden
set noerrorbells visualbell t_vb=

" No ringing
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

if has('nvim')
    set nohlsearch!
endif

set ic
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set rnu
set nu
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

set rtp^="/home/asus/.opam/4.06.0/share/ocp-indent/vim"
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'nightsense/strawberry'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'relastle/bluewery.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'vimoxide/vim-cinnabar'
Plug 'bignimbus/pop-punk.vim'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'alx741/vim-rustfmt'
" Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
"Plug 'jaspervdj/stylish-haskell'
Plug 'chrisdone/hindent'
Plug 'urso/haskell_syntax.vim'
Plug 'powerline/fonts'
"Plug 'neovimhaskell/haskell-vim'
" For the low bar
Plug 'vim-airline/vim-airline'
" Repo with a shit ton of colorschemes
" Link : https://github.com/rafi/awesome-vim-colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'artanikin/vim-synthwave84'
" Monokai theme
Plug 'sickill/vim-monokai'
" Palenight theme
Plug 'drewtempelmeyer/palenight.vim'

Plug 'sheerun/vim-polyglot'
"Plug 'Valloric/YouCompleteMe'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
call plug#end() 


colorscheme base16-gruvbox-dark-medium
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

let g:airline_powerline_fonts=0
let g:termguicolors=256
let mapleader = " "
let g:rustfmt_on_save = 0

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25



let g:ctrlp_use_caching = 0
 
nnoremap <Space><Space> <ESC>/<++><Enter>"_c4l

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

nnoremap <leader>ff :Files<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>ag :Ag<CR>
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

fun! TSCompile()
    nnoremap <leader>ts :!tsc<ESC>
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


autocmd FileType cpp,cxx,h,hpp,c :call GoCoc()

autocmd FileType zig :call GoCoc()

autocmd FileType javascript,typescript :syntax on
autocmd FileType javascript,typescript :call GoCoc()

autocmd FileType scala,sc :call GoCoc()

" autocmd FileType typescript,javascript,html :colorscheme pop-punk 
autocmd FileType typescript :call TSCompile()

autocmd FileType vimscript :colorscheme Atelier_DuneDark

autocmd FileType rust :call GoCoc()
autocmd FileType rust :call RsPrintln()
autocmd FileType rust :call RustFmt()

autocmd FileType haskell :syntax on

" Making automated <tag></tag>s for html documents
autocmd FileType javascript,typescript,html inoremap ;b <b></b><Enter><++><Esc>kf/hi
autocmd FileType javascript,typescript,html inoremap ;bt <button></button><Enter><++><Esc>kf/hi
autocmd FileType javascript,typescript,html inoremap ;p <p></p><Enter><++><Esc>kf/hi
autocmd FileType javascript,typescript,html inoremap ;h1 <h1></h1><Enter><++><Esc>kf/hi
autocmd FileType javascript,typescript,html inoremap ;h2 <h2></h2><Enter><++><Esc>kf/hi
autocmd FileType javascript,typescript,html inoremap ;h3 <h3></h3><Enter><++><Esc>kf/hi

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## cac131f229f7457d502490141e9b8d04 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/asus/.opam/4.06.0/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line


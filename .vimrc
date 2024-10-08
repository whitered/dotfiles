if empty(glob("~/.vim/autoload/plug.vim"))
  echo "Installing Vim Plug"
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" Spacebar is a much better leader than \ or ,
let mapleader = "\<Space>"
" let mapleader = ","

""""" PLUGINS """""
call plug#begin()
" ESSENTIALS

Plug 'tpope/vim-sensible' " Sensible defaults
Plug 'rstacruz/vim-opinion' " More sensible defaults

Plug 'ervandew/supertab' " Tab complete everything

Plug 'ctrlpvim/ctrlp.vim' " Fuzzy-matching go-to file
nnoremap <C-b> :CtrlPBuffer<CR>
map <C-t> :CtrlPBufTag<CR>
" Make ctrlp faster
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" if has('python') ||  has('python3')
"   " Faster and more accurate fuzzy-matching
"   Plug 'felikz/ctrlp-py-matcher'
"   let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" endif

Plug 'dyng/ctrlsf.vim'  " ag-powered search with in-place editing
let g:ctrlsf_ackprg = 'rg'
nmap     <C-f>f :CtrlSF ''<Left>
nmap     <C-f>n <Plug>CtrlSFCwordPath
nnoremap <C-f>t :CtrlSFToggle<CR>

Plug 'tpope/vim-repeat'  " make more actions repeatable with .
Plug 'machakann/vim-sandwich' " motions for handling surrounding characters
Plug 'tpope/vim-unimpaired'  " useful bracket maps and option toggling

Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim'  " for code comments

" Buffers
Plug 'moll/vim-bbye'  " delete buffer without closing window
nnoremap X :Bdelete<CR>
Plug 'vim-scripts/BufOnly.vim'  " delete all but current buffer
Plug 'jeetsukumaran/vim-buffergator'

Plug 'scrooloose/nerdtree'
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>D :NERDTreeFind<CR>
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=1

" NICE TO HAVE
Plug 'AndrewRadev/splitjoin.vim'

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='tomorrow'
" Explicitly specify which extensions to use
let g:airline_extensions = ['branch', 'ctrlp', 'tabline', 'whitespace']

Plug 'christoomey/vim-tmux-navigator'
Plug 'jszakmeister/vim-togglecursor'  " change cursor shape when entering insert mode

" Snippets
" if version >= 704 && has('python') || has('python3') | Plug 'SirVer/ultisnips' | endif
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Plug 'honza/vim-snippets'

Plug 'fcpg/vim-spotlightify'  " Highlight and show number of matches when searching

Plug 'majutsushi/tagbar', {'on': 'Tagbar'}
" Open tagbar
map <leader>\ :Tagbar<CR>
let g:tagbar_autofocus = 1

Plug 'wellle/targets.vim'  " because cin), etc. is awesome
Plug 'tpope/vim-dispatch' " So we can run tests asynchronously
Plug 'janko-m/vim-test'  " For running tests
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>
let test#strategy = "dispatch"
" -s for ipdb support; disable cacheprovider so we don't break 'py.test --lf'
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -p no:cacheprovider'

" Plug 'mattn/emmet-vim'  " Write HTML fast
" " When in javascript, expand to 'className' (for jsx support)
" let g:user_emmet_settings = {
"   \    'javascript': {'extends': 'jsx'},
"   \    'javascript.jsx': {'extends': 'jsx'}
"   \ }
" let g:user_emmet_leader_key = ','

Plug 'jiangmiao/auto-pairs' " autoclose parens, quotes, etc.
if has('mac')
  Plug 'junegunn/vim-xmark', { 'do': 'make' }  " Live markdown preview
endif
Plug 'mtth/scratch.vim'
let g:scratch_no_mappings = 1
let g:scratch_height = 20
let g:scratch_filetype = 'markdown'
let g:scratch_persistence_file = '.scratch'
" Open scratch buffer with space-tab (automatically set syntax to python)
nnoremap <silent> <leader><tab> :Scratch<cr>

" GIT
Plug 'airblade/vim-gitgutter'
" Set gitgutter's bindings manually to avoid clashes
let g:gitgutter_map_keys = 0
nmap <leader>gh <Plug>(GitGutterStageHunk)
nmap <leader>gH <Plug>(GitGutterUndoHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)

" update gitgutter faster
set updatetime=500

" Plug 'tpope/vim-fugitive'  " git integration
Plug 'tpope/vim-rhubarb'  " For :Gbrowse
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
" Open current file on Github
map <leader>gB :Gbrowse -<CR>
" Open currently selected lines on Github
vmap <leader>gB :Gbrowse -<CR>
map <leader>gr :Gread<CR>
map <leader>gw :Gwrite<CR>
noremap <Leader>gp :Gpush<CR>

Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim', {'on': 'Gist'}
" Make gists private by default
let g:gist_post_private = 1
" Browse to gist after posting it
let g:gist_open_browser_after_post = 1

" COLOR
Plug 'NLKNguyen/papercolor-theme'
Plug 'sloria/vim-hybrid'  " hybrid with easier-to-read line numbers

" LANGUAGE-SPECIFIC
Plug 'sheerun/vim-polyglot'  " syntax files for most languages
" let g:polyglot_disabled = ['python', 'latex'] " Use python-syntax and vimtex
let g:jsx_ext_required = 0
let g:markdown_fenced_languages = ['javascript', 'python', 'clojure', 'ruby']

" --- Javascript ---
" Plug 'lfilho/cosco.vim'  " Quick insertion of commas and semicolons
" augroup cosco
"   autocmd!
"   autocmd FileType javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
" augroup END
" Plug 'heavenshell/vim-jsdoc'  " For making JS docstrings
" let g:jsdoc_default_mapping = 0
" map <C-c>j <Plug>(jsdoc)

" --- CSS ---
Plug 'chrisbra/Colorizer'  " Highlight CSS colors
let g:colorizer_auto_filetype='css,html'

" --- Elixir ---
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-endwise' " auto add 'end' to 'do' blocks

Plug 'tidalcycles/vim-tidal'
let g:tidal_default_config = {"socket_name": "default", "target_pane": "1.1"}
let maplocalleader=","

Plug 'jremmen/vim-ripgrep'
call plug#end()

filetype plugin indent on
""" end plugins """

""" BASE CUSTOMIZATIONS """
set shell=/bin/bash
" NOTE: Many base customizations come from vim-sensible and vim-opinion
set encoding=utf-8
set relativenumber
set autoread " reload files when changed on disk, i.e. via `git checkout`
" set clipboard^=unnamedplus,unnamed " Make "yanks" work with system clipboard
set numberwidth=3
set splitright
set splitbelow

" Indents
set autoindent
set expandtab " expand tabs by default (overloadable per file type later)
set tabstop=2 softtabstop=2 shiftwidth=2
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'

" No bells
set noerrorbells visualbell t_vb=

" No redrawing during macros
set lazyredraw

""" VISUAL SETTINGS """
if &term =~ '256color' | set t_ut= | endif

" easy toggle colorscheme with background
function! ToggleBg()
  if &background == "dark"
    set background=light | colorscheme hybrid-sl
  else
    set background=dark | colorscheme PaperColor
  endif
endfunction

nnoremap <Leader>bg :call ToggleBg()<CR>

set background=light | call ToggleBg() " start with dark theme

" Show trailing whitespace
set list listchars=tab:▸\ ,trail:▫

set cursorline  " have a line indicate cursor location
set previewheight=25  " Larger preview height

" Set minimum window size to 79x5.
set winwidth=79 winheight=5 winminheight=5

" Patterns to ignore for expand(), ctrlp, etc.
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.swp,*~,._*,*.pyc,*__pycache__*,*.egg-info

" Persistent undo (can use undos after exiting and restarting)
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo// undodir+=~/.vim/undo// undofile
endif

""" SHORTCUTS """
" Quickly edit vimrc
nmap <leader>, :e $MYVIMRC<CR>
" Reload vimrc
noremap <silent> <leader>V :source $MYVIMRC<cr>
" Search and replace, using : as a separator instead of /
noremap <leader>sr :%s:::cg<Left><Left><Left><Left>
" Remove trailing whitespace with Backspace
nnoremap <BS> :%s/\s\+$//<cr>:let @/=''<CR>
" select last pasted text
nnoremap gp `[v`]
" Easy syntax switching
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tm :set ft=markdown<CR>
nnoremap <leader>Ty :set ft=yaml<CR>
" Quickly write/quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
" Quickly open netrw
nnoremap <leader>e :e.<CR>
" Quick split
nnoremap <Leader>v <C-w>v<C-w>w
" Quick select whole file
map <leader>a ggVG
" Make D delete to end of line
nnoremap D d$
" Make Y yank to end of line
nnoremap Y y$
" Go to beginning/end of line
noremap <leader>h ^
noremap <leader>l $
" Execute macro
nnoremap Q @q
" Move vertically over wrapped lines
nmap j gj
nmap k gk
" Set cwd to current file
nnoremap <leader>cd :lcd %:p:h<CR>
" Split lines (opposite of J)
nnoremap S i<CR><Esc>
nnoremap <leader>N "=strftime("%F")<CR>P
vnoremap <C-r> "hy:%s/<C-r>h//<left>

augroup configgroup
  autocmd!
  " Make sure Vim returns to the same line when you reopen a file.
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute 'normal! g`"zvzz' | endif

  " Automatically adjust quickfix window depending on how much text there is
  autocmd FileType qf call AdjustWindowHeight(3, 20)
  function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
  endfunction

  """ Languages
  " prose (hard wrap and autoformat paragraphs)
  autocmd BufRead,BufNewFile jrnl*.txt,editor*.txt set filetype=markdown
  autocmd BufRead,BufNewFile jrnl*.txt,editor*.txt,*.md,*.rst setlocal nolist formatoptions+=ntl textwidth=72 wrapmargin=0
  autocmd BufRead,BufNewFile .eslintrc set filetype=json
  " commit messages
  autocmd Filetype gitcommit setlocal nolist textwidth=72
augroup END

" GUI settings, e.g. MacVim
set guifont=Ubuntu\ Mono:h14
" Hide scrollbars and menu
set guioptions-=T guioptions-=R guioptions-=r guioptions-=m guioptions-=l guioptions-=L

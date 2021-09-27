call plug#begin('~/.vim/plugged')

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Git
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
"Ruby
Plug 'vim-ruby/vim-ruby'
" Plug 'danchoi/ri.vim'
Plug 'tpope/vim-rails'
Plug 'ecomba/vim-ruby-refactoring'
" HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript'] }
Plug 'tpope/vim-haml', { 'for': 'haml'}
" Linter
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Color schemes
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'antlypls/vim-colors-codeschool'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

syntax enable
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Transparent background
" hi Normal ctermbg=NONE

" Set backup dirs
set undodir=~/.vim/.undo//
" set backupdir=~/.vim/.backup//
set dir=~/.vim/.swp//

" For completion
set path+=**
set path-=/usr/include
set wildmenu
set wildignore+=**/node_modules/**,**/db/**,**/vendor/**,public/**,**/log/**,**/tmp/**

" Grep searching
set grepprg=ack

let g:mapleader=","

let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore = ['^node_modules$']

" map copy and paste functionality
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>yy "+yy

" _ is a black hole register (/dev/null)
" vnoremap p "_dP


" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nmap <Leader>w :w<CR>

" tabs & buffers
" map <leader>o :tabnew<CR>
" map <leader>[ :tabprev<CR>
" map <leader>] :tabnext<CR>
" map <leader>W :bd<CR>

" Prev/Next buffer
map <F1> :bp<CR>
map <F2> :bn<CR>

" insert a space
nmap <space> a<space><Esc>
" insert empty line over
nmap <Leader>k O<Esc>
" insert empty line below
nmap <Leader>K i<Enter><Esc>
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

" insert debug breakpoint
nmap <Leader>pry Orequire 'pry'; binding.pry<Esc>

" Jump to the end of the line in Insert mode
inoremap <C-e> <C-o>$
" Jump to start of the line in Insert mode
inoremap <C-i> <C-o>I

" Reindent
nmap <leader>ai mzgg=G`z

" ri.vim
" ===============
" horizontal split
" nnoremap  <leader>ri :call ri#OpenSearchPrompt(0)<cr>
" vertical split
" nnoremap  <leader>RI :call ri#OpenSearchPrompt(1)<cr>
" keyword lookup
" nnoremap  <leader>RK :call ri#LookupNameUnderCursor()<cr>
" ===============

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-A> :ZoomToggle<CR>
" ===============

set nocp
set number
set relativenumber
set ruler
set laststatus=2
set expandtab
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<
set visualbell
set t_vb=

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Rendering
set scrolloff=2
set sidescrolloff=5
set wrap
set cursorline

" Open NerdTree aftre start vim
" autocmd VimEnter * NERDTree

" Auto remove trailing space before saving
autocmd FileType ruby autocmd BufWritePre <buffer> %s/\s\+$//e

" mark line has more than 100 characters
set colorcolumn=100
" highlight ColorColumn ctermbg=236 guibg=lightgrey
" au BufRead,BufNewFile * syntax match ErrorMsg /\%>100v.\+/

" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

" vim-ruby
let g:ruby_indent_block_style = 'do'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_ruby_rubocop_exe = 'bundle exec rubocop'
let g:syntastic_enable_ruby_checker = 1

" air-line
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.whitespace = 'Ξ'


" Fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" Rg command of fzf
command! -bang -nargs=* Rg 
 \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>),
 \ 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <silent><leader>o :Files<CR>
nnoremap <silent><Leader>g :Rg<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

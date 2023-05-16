call plug#begin('~/.vim/plugged')

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Git
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
"Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ecomba/vim-ruby-refactoring'
" HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript', 'javascriptreact'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'javascriptreact'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript', 'javascriptreact'] }
Plug 'tpope/vim-haml', { 'for': 'haml'}
" Linter
" Plug 'vim-syntastic/syntastic'
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

" LSP
Plug 'neovim/nvim-lspconfig'

" Auto-completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Code snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" LSP + fzf
Plug 'ojroques/nvim-lspfuzzy'

" File utils like renaming, deleting, sudo write, etc.
Plug 'tpope/vim-eunuch'

Plug 'andymass/vim-matchup'

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

" Map ctrl-movement keys to window switching
nmap <C-k> <C-w><Up>
nmap <C-j> <C-w><Down>
nmap <C-l> <C-w><Right>
nmap <C-h> <C-w><Left>
nmap <Leader>w :w<CR>

" tabs & buffers
" map <leader>W :bd<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-]> gt
nnoremap <C-[> gT

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

" Auto remove trailing space before saving
autocmd FileType ruby autocmd BufWritePre <buffer> %s/\s\+$//e

" mark line has more than 120 characters
set colorcolumn=120
" highlight ColorColumn ctermbg=236 guibg=lightgrey
" au BufRead,BufNewFile * syntax match ErrorMsg /\%>120v.\+/

" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

" vim-ruby
let g:ruby_indent_block_style = 'do'

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

lua require('lspfuzzy').setup {}
imap <silent><expr> <Tab> '<Plug>luasnip-expand-or-jump'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" Run rubocop -a
function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
endfunction
map <silent> <Leader>cop :call RubocopAutocorrect()<cr>

set noswapfile

" copy current file name to system clipboard (Linux version)
nnoremap <leader>cp :let @+=expand("%:.")<CR>
nnoremap <leader>cP :let @+=expand("%:p")<CR>

nnoremap <leader>ml :s /{\s\?\(.\+\)\s\?}$/do\r\1\rend/<CR>==k== <bar> :noh<CR>
nnoremap <leader>di A # rubocop:disable 

" set react file type for *.js files to load all snippets
autocmd BufNewFile,BufRead *.js set filetype=javascriptreact

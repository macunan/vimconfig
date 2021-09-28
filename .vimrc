set nocompatible
syntax enable
filetype plugin on
set path+=**
set wildmenu
set number
set clipboard=unnamedplus
colorscheme industry
set backspace=indent,eol,start
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'chrisbra/vim-commentary'
Plug 'jlanzarotta/bufexplorer'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar'
" Plug 'puremourning/vimspector'
" Plug 'codota/tabnine-vim'
" Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'
" Plug 'yaegassy/coc-htmldjango'
call plug#end()
set laststatus=2
let mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>d :term python -m pudb % <cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
" Close current buffer
map <leader>bd :Bclose<cr>
map <leader>tt :term<cr>
" Close all buffers
map <leader>ba :1,1000 bd!<cr>
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
map <leader>o :BufExplorer<cr>
" Quickly find and open a file in the CWD
let g:ctrlp_map = '<C-f>'
" Quickly find and open a recently opened file
map <leader>f :Locate .<CR>
map <leader>h :History .<CR>
" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
nmap <F8> :TagbarToggle<CR>
nmap <F9> :GitGutterToggle<CR>
let g:rainbow_active = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
" let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
command! -nargs=0 Prettier :CocCommand prettier.formatFile
map <leader>p :Prettier<cr>
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>8j>a
nnoremap ,css  :-1read $HOME/.vim/.skeleton.css<CR>8j>a

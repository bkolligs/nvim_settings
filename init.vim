" Set directory for installing vim plugins into 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim' , {'branch':'release'}
Plug 'psliwka/vim-smoothie'
"Plug 'junegunn/fzf', {'do': {->fzf#install()}}
Plug 'ThePrimeagen/vim-be-good'
Plug 'preservim/nerdtree'

call plug#end()

" Set line number 
set relativenumber number

" set up relative lin numbers to toggle off focus/insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" remap escape to j+j from insert mode
inoremap jj <ESC>

" set word wrap
set wrap

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" map the leader key to space
let mapleader = " "

" map nerdtree toggle
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" set the tabs size to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

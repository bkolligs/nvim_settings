" Set directory for installing vim plugins into 
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim' , {'branch':'release'}

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

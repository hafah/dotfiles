"general
set number
set relativenumber
set noundofile
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

"leader
let mapleader = ","

"keybindings
imap jk <ESC>
vmap jk <ESC>
nmap <leader>w :w!<cr>

"vimplug installer
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vimplug packages
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'wikitopian/hardmode'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
call plug#end()

"emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"hardmode
nmap <leader>hm <Esc>:call ToggleHardMode()<CR>

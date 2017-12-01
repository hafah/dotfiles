"general

set number
set relativenumber


"keybindings

imap jk <ESC>

"vimplug
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
call plug#end()

"emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

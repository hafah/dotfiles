"general
set number
set relativenumber
set noundofile
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

"leader
let mapleader = ","

"colours
au BufRead,BufNewFile *.twig *.volt set filetype=htmljinja

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
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/limelight.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mitsuhiko/vim-jinja'
call plug#end()

"emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"hardmode
nmap <leader>hm <Esc>:call ToggleHardMode()<CR>

"limelight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
let g:limelight_conceal_ctermfg = 'gray'	
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'	
let g:limelight_conceal_guifg = '#777777'

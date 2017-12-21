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
autocmd FileType python map <leader>t :call Flake8()<CR>

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
Plug 'junegunn/vim-journal'
Plug 'junegunn/limelight.vim'
Plug 'vim-syntastic/syntastic'
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

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2"

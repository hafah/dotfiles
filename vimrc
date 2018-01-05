"general
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set relativenumber
set noundofile
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set splitbelow
set splitright

"leader
let mapleader = ","

"colours
au BufRead,BufNewFile *.volt set filetype=htmljinja
au BufRead,BufNewFile *.tpl set filetype=html

"keybindings
imap jk <ESC>
vmap jk <ESC>
nmap <leader>w :w!<cr>
nmap <leader>n i<cr><ESC>
autocmd FileType python map <leader>t :call Flake8()<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"easy copy pasta
set clipboard=unnamedplus
nmap <leader>= ggVG=
nmap <leader>a ggVG
nmap <leader>p +p

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
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'mitsuhiko/vim-jinja'
Plug 'Shutnik/jshint2.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ddrscott/vim-side-search'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

"ctrlp
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

"emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"hardmode
nmap <leader>hm <Esc>:call ToggleHardMode()<CR>

"jshint
let jshint2_read = 1
let jshint2_save = 1

"limelight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
let g:limelight_conceal_ctermfg = 'gray'	
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'	
let g:limelight_conceal_guifg = '#777777'

"sidesearch
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

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
let g:syntastic_python_pylint_args = "--errors-only"

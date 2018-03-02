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
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/limelight.vim'
Plug 'vim-syntastic/syntastic'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'mitsuhiko/vim-jinja'
Plug 'Shutnik/jshint2.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ddrscott/vim-side-search'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/csapprox'
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/seoul256.vim'

call plug#end()

"general
filetype plugin indent on
syntax on
set t_ti= t_te=p
set cursorline
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set noundofile
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set splitbelow
set splitright
set noshowmode
set noshowcmd
set laststatus=2

"leader
let mapleader = ","
nmap <leader>n i<CR><ESC>
nmap <leader>w :w!<CR>
nmap <leader>rp :!clear && python %<CR>
nmap <leader>rb :!clear && bash %<CR>
nmap <leader>rc :!rm -f a.out && clear && g++ %<CR>
nmap <leader>rf :!./a.out<CR>
nmap <leader>nn :NERDTreeToggle<CR>
vmap <leader>/ :Commentary<CR>
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pc :PlugClean<CR>

"colours
set t_Co=256
set background=dark
colorscheme seoul256
au BufRead,BufNewFile *.volt set filetype=htmljinja
au BufRead,BufNewFile *.tpl set filetype=html

"fonts
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11

"keybindings
imap jk <ESC>
vmap jk <ESC>
autocmd FileType python map <leader>t :call Flake8()<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"disable arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

"easy copy pasta
set clipboard=unnamedplus
nmap <leader>= ggVG=
nmap <leader>a ggVG
nmap <leader>p +p

"ctrlp
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

"emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"fzf
command! -bang FLines call fzf#vim#grep(
     \ 'grep -vnITr --color=always --exclude-dir=".git" --exclude-dir="www/vendor" "^$"', 
     \ 0,  
     \ {'options': '--reverse --prompt "FLines> "'})

nnoremap <silent> <leader>e :FLines<cr>

"goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"hardmode
nmap <leader>hm <Esc>:call ToggleHardMode()<CR>

"jshint
let jshint2_read = 1
let jshint2_save = 1

"lightline
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

"limelight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
let g:limelight_conceal_ctermfg = 'gray'	
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'	
let g:limelight_conceal_guifg = '#777777'

"sidesearch
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

"snippets
au FileType php imap func<tab> jkdbipublic function () {}jkhi<CR>jkk$hhi

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = "--standard=PSR2"
let g:syntastic_python_pylint_args = "--errors-only"

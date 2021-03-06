"vimplug installer
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vimplug packages
call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim', { 'for': ['html', 'volt', 'php'], 'do': 'ConnectEmmet' }
Plug 'w0rp/ale', { 'for': ['php', 'js', 'javascript.jsx', 'volt'] }
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-janah'
Plug 'junegunn/seoul256.vim'
Plug 'posva/vim-vue'
Plug 'lumiliet/vim-twig'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'Shutnik/jshint2.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'joonty/vdebug', { 'tag': 'v1.5.2' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim',
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ddrscott/vim-side-search', { 'on': 'SideSearch' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/csapprox'
Plug 'wakatime/vim-wakatime'
Plug 'itchyny/lightline.vim'
call plug#end()

"general
filetype plugin indent on
set nocompatible
set t_ti= t_te=p
set timeoutlen=1000 ttimeoutlen=0
set number
set hidden
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set noundofile
set noswapfile
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set splitbelow
set splitright
set noshowmode
set noshowcmd
set laststatus=2

"leader
let mapleader = ","
nmap <leader>w :w!<CR>
nmap <leader>rp :!python3 %<CR>
nmap <leader>re :!perl %<CR>
nmap <leader>rl :w && !!<CR>
nmap <leader>rb :!bash %<CR>
nmap <leader>rc :!rm -f a.out && clear && g++ %<CR>
nmap <leader>rf :!./a.out<CR>
nmap <leader>nn :NERDTreeToggle<CR>
vmap <leader>/ :Commentary<CR>
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pc :PlugClean<CR>

"colours
set t_Co=256
syntax on
colo seoul256
set background=dark
"autocmd ColorScheme janah highlight Normal ctermbg=235


function! HighlightCursor()
    set cursorline!
    highlight CursorLine ctermfg=0 ctermbg=2
endfunction

"filetype
au BufRead,BufNewFile *.volt set filetype=twig
au BufRead,BufNewFile *.phtml,*.tpl set filetype=html

"fonts
set encoding=utf8

"keybindings
nmap ,g :!git difftool -y<CR>
command Wq wq
command W w
nmap <silent> <leader>t :silent !powershell.exe -command "Add-Type -AssemblyName System.Windows.Forms; [Windows.Forms.Cursor]::Position = \"-1290,50\"; Add-Type -MemberDefinition '[DllImport(\"user32.dll\")] public static extern void mouse_event(int flags, int dx, int dy, int cButtons, int info);' -Name U32 -Namespace W; [W.U32]::mouse_event(6,0,0,0,0); [Windows.Forms.Cursor]::Position = \"50,90\"; [W.U32]::mouse_event(6,0,0,0,0);"<CR><CR>
nmap <silent> <leader>ts :silent !powershell.exe -command "Add-Type -AssemblyName System.Windows.Forms; [Windows.Forms.Cursor]::Position = \"80,55\"; Add-Type -MemberDefinition '[DllImport(\"user32.dll\")] public static extern void mouse_event(int flags, int dx, int dy, int cButtons, int info);' -Name U32 -Namespace W; [W.U32]::mouse_event(6,0,0,0,0); [Windows.Forms.Cursor]::Position = \"880,90\"; [W.U32]::mouse_event(6,0,0,0,0);"<CR><CR>

autocmd FileType python map <leader>t :call Flake8()<CR>
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>

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

"autocomplete
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

"easy copy pasta
"set clipboard=unnamedplus
nmap <leader>= ggVG=
nmap <leader>a ggVG
"nmap <leader>p +p

"ale
let g:ale_enabled = 1
let g:ale_linters = {'php': ['php -l', 'phpcs'], 'javascript.jsx': ['eslint'], 'javascript': ['eslint']}
let g:ale_fixers = {'javascript.jsx': ['eslint']}
let g:ale_javascript_eslint_use_global = 1

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
function! ConnectEmmet()
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
    imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
    let g:user_emmet_leader_key='<Tab>'
    let g:user_emmet_settings = {
      \  'javascript.jsx' : {
        \      'extends' : 'jsx',
        \  },
      \}
endfunction

command! -bang -nargs=* FLines call fzf#vim#grep('rg --color=always --column --line-number --no-heading '.shellescape(<q-args>), 1, <bang>0)
nnoremap <silent> <leader>e :FLines<cr>
nnoremap <silent> <C-p> :GFiles<cr>

"goyo
let g:goyo_width = '120'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd! User GoyoEnter silent !tmux set status off
autocmd! User GoyoLeave silent !tmux set status on

"jshint
let jshint2_read = 1
let jshint2_save = 1

"lightline
let g:lightline = { 'colorscheme': 'seoul256' }

"limelight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
let g:limelight_conceal_ctermfg = 'gray'	
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'	
let g:limelight_conceal_guifg = '#777777'

"sidesearch
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

"vdebug
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9999
let g:vdebug_options["server"] = "172.23.39.193"
let g:vdebug_options["break_on_open"] = 0
let g:vdebug_options["ide_key"] = "PHPSTORM"
let g:vdebug_options['debug_file_level'] = 3
let g:vdebug_options["debug_file"] = "~/repos/hafah/vdebug/vdebug.log"
let g:vdebug_options['path_maps'] = {
      \  '/var/web' : '/mnt/c/Users/Brahim/repos/hafah/web',
      \}


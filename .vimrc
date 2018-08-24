" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

	
	

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_alt_sep = '|'


set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set hlsearch
set noerrorbells
set wildmenu wildmode=list:longest,full
set number
set laststatus=2
set statusline=%F%r%h%=
set showmatch
set helpheight=999
set scrolloff=8
set showcmd
set tabstop=2
set smartindent
set autoindent
set wildmode=list:longest
set list listchars=tab:\▸\-
set clipboard=unnamed,unnamedplus
set ruler
set splitbelow
set title
set list


autocmd ColorScheme * highlight LineNr ctermfg=200
set clipboard=unnamed,autoselect

if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif


"バックアップをつくらない
set nowritebackup
set nobackup
set noswapfile
inoremap jj <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

map <C-n> :NERDTreeToggle<CR>

""Ctrl+eでpythonを実行----------------
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python3 %




"おわり------------------------------------




if &compatible
  set nocompatible
endif
 let g:dein_dir = expand('~/.cache/dein')
 let s:dein_repo_dir = g:dein_dir . '/repos/github.com/Shougo/dein.vim' 
if !isdirectory(s:dein_repo_dir)
 execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(g:dein_dir)
   let s:toml = g:dein_dir . '/dein.toml'
   let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'
   call dein#begin(expand('~/.cache/dein'), [$MYVIMRC,s:toml])
" TOMLファイルにpluginを記述
   call dein#load_toml(s:toml, {'lazy': 0})
   call dein#load_toml(s:lazy_toml,{'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
 " 未インストールを確認
if dein#check_install()
   call dein#install()
endif

filetype plugin indent on
syntax enable




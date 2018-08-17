set number
set fenc=utf-8
set showcmd
set cursorline
set cursorcolumn
set smartindent
set showmatch
set list listchars=tab:\▸\-
set hlsearch


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"ハイライトを変更
highlight Comment ctermfg=Green
highlight Constant ctermfg=Red
highlight Identifier ctermfg=Cyan
highlight Statement ctermfg=Yellow
highlight Title ctermfg=Magenta
highlight Special ctermfg=Magenta
highlight PreProc ctermfg=Magenta
"------------------------------------

"Ctrl+eでpythonを実行----------------
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python3 %

"おわり------------------------------------
"
"

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

  let s:dein_path = expand('~/.cache/dein')
  let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

  " dein.vim がなければ github からclone
if &runtimepath !~# '/dein.vim'
 if !isdirectory(s:dein_repo_path)
        execute '!git clone https://github.com/Shougo/dein.vim'
        s:dein_repo_path
 endif
            execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif	    
	    
	    " Required:
set runtimepath+=/home/kittyomu/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_path)
              call dein#begin(s:dein_path)

                let g:config_dir  = expand('~/.cache/dein/userconfig')
                  let s:toml        = g:config_dir . '/plugins.toml'
                    let s:lazy_toml   = g:config_dir . '/plugins_lazy.toml'

                      " TOML 読み込み
                        call dein#load_toml(s:toml,      {'lazy': 0})
                          call dein#load_toml(s:lazy_toml, {'lazy': 1})

                            call dein#end()
                              call dein#save_state()
endif
" Required:
if dein#load_state('/home/kittyomu/.cache/dein')
  call dein#begin('/home/kittyomu/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/kittyomu/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
"プラグインたち-------------------------------

  call dein#add('shougo/unite.vim')

"--------------------------------------------i
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts------------------------



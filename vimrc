" Maintainer:	Jayden <jayden717@gmail.com>
" Last change:	2013-01-10 
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Set up Vundle:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
set nocompatible     " be iMproved, required
filetype off         " required

" set the runtime path to include Vundle and initialize
if has("win32")
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
	set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" 代码存放在 github
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Mizuchi/STL-Syntax'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Chiel92/vim-autoformat'
Plugin 'sjl/gundo.vim'
Plugin 'fatih/vim-go'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'
Plugin 'altercation/vim-colors-solarized'

" 代码存放在 vim script 
Plugin 'grep.vim'

" 代码存放在其他地方
" Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()   " required

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" ******** file encode ********
" unix or dos file
set fileformats=unix,dos

" euc-cn is alias to gb2312
" set vi inside coding, must be set when you use gbk or utf-8
set encoding=utf-8

" actual file encoding, will set as it except fileencodings load other
" set fileencoding=gb2312
" 设置文件编码
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif

" 设置文件编码检测类型及支持格式
set fileencodings=utf-bom,utf-8,gbk,gb2312,gb18030,cp936,latin1

" terminal encoding
" even if you set utf-8 in ssh client
set termencoding=utf-8

" 指定菜单语言
set langmenu=zh_CN.UTF-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8 
" 显示行号
set number
" 使用space代替tab
set expandtab 
" 四个空格代替tab
set tabstop=4
" 自动缩进的宽度
set shiftwidth=4
"让vim把连续数量的空格视为一个制表符
set softtabstop=4

" 取消查找内容高亮显示
set nohlsearch
set textwidth=78 
set formatoptions+=mM

" 高亮显示当前行/列
"set cursorline
"set cursorcolumn
 
" 绑定在窗口之间移动的快捷键
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>

"打开文件类型检测,关掉智能补全时的预览窗口
filetype plugin indent on
set completeopt=longest,menu

" 绑定功能键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <F2> <ESC>:set mouse=v<RETURN>
"map <F3> <ESC>:set mouse=a<RETURN>
map <F2> <ESC>:set mouse-=a<RETURN>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  
"配置 airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna" 
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1

if has("win32")
" 设置consolas字体"
set guifont=Consolas\ for\ Powerline\ FixedD:h11

"设置状态栏符号显示，下面编码用双引号"
let g:Powerline_symbols="fancy"
let g:airline_symbols = {}
let g:airline_left_sep = "\u2b80" 
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"

"设置顶部tabline栏符号显示"
let g:airline#extensions#tabline#left_sep = "\u2b80"
let g:airline#extensions#tabline#left_alt_sep = "\u2b81"
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"配置 solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if !has("win32")

syntax enable
if has('gui_running')
    set background=dark
else
    set background=dark
endif
"set t_Co=256
let &t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

colorscheme solarized
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 配置 grep.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :Grep<CR>
nmap <S-n> :cnext<CR>
nmap <S-p> :cprev<CR> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nerdcommenter 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = ","
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"配置 YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ignore_files=[".*\.py$"]  
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 
let g:ycm_global_ycm_extra_conf = 'C:\\Users\\Jayden\\.ycm_extra_conf.py'  
"让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu    
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全            
let g:ycm_seed_identifiers_with_syntax=1
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_diagnostic_highlighting = 0

let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

nmap <F4> :YcmDiags<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"UltiSnips快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlp 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,.svn
else
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
endif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'ra'

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"配置Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let tagbar_left=1 
let g:tagbar_width=35
let g:tagbar_autofocus=1
nnoremap <F5> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nerdtree 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos='right'
nnoremap <F6> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Fast editing of .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>e :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 配置tags|Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path=.
if has("win32")
set tags=.\tags
else
set tags+=./tags
endif

"Cscope设置
set cscopequickfix=s-,c-,d-,i-,t-,e-
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"quickfix 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:my_quickfix_win_height=10
nmap <leader>co :QFix<CR>
nmap <leader>ct :call QFixToggle(1)<CR>
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "copen ".g:my_quickfix_win_height
        else
            copen
        endif
    endif
endfunction
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

map <F7> <ESC>:QFix<RETURN>   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"gundo.vim 设置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F8> :GundoToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"	 	\ | wincmd p | diffthis

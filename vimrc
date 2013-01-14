" Maintainer:	Jayden <jayden717@gmail.com>
" Last change:	2013-01-10 
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

"自动加载pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
"disable some plugin
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'neocomplcache')
call add(g:pathogen_disabled, 'echofunc')

call pathogen#infect()

" neocomplcach 设置
let g:neocomplcache_enable_at_startup=1
if has("win32")
"    source $VIM/vimfiles/neocomplcache.conf
else
"    source ~/.vim/neocomplcache.conf
endif

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" 设置编码
set encoding=utf-8
" 设置文件编码检测类型及支持格式
"set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,chinese,latin-1
" 设置文件编码
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
" 指定菜单语言
set langmenu=zh_CN.UTF-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8 
" 设置配色方案
"colorscheme evening 

" 显示行号
set number
" 使用space代替tab
set expandtab 
" 四个空格代替tab
set tabstop=4
" 自动缩进的宽度
set shiftwidth=4
" 取消查找内容高亮显示
set nohlsearch
set textwidth=78 
set formatoptions+=mM

" 绑定在窗口之间移动的快捷键
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k

" 绑定tabbar在多个文件中切换
map L :Tbbn<RETURN>             
map H :Tbbp<RETURN>              

" 绑定功能键
"map <F2> <ESC>:set mouse=v<RETURN>
"map <F3> <ESC>:set mouse=a<RETURN>
map <F2> <ESC>:set mouse-=a<RETURN>
  
" grep.vim 设置
nnoremap <silent> <F3> :Grep<CR>
nmap <S-n> :cnext<CR>
nmap <S-p> :cprev<CR> 

" ctrlp 设置
if has("win32")
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,.svn
else
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
endif
"let g:ctrlp_clear_cache_on_exit = 1
"let g:ctrlp_working_path_mode = 'ra'

" nerdtree 设置
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
nnoremap <F4> :NERDTreeToggle<CR>

" nerdcommenter 设置
let mapleader=","

" clang_complete
let g:clang_use_library=1
if has("win32")
    let g:clang_library_path="C:/MinGW/clang+llvm-3.2-x86-mingw32-EXPERIMENTAL/bin"
else
    let g:clang_library_path="/home/jayden/llvm/lib"
endif
let g:clang_complete_auto = 1 
"let g:clang_auto_user_options='path, ~/.clang_complete'
"let g:clang_use_library=1
"let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'

" tagbar 设置
nmap <silent> <F5> :TagbarToggle<CR>
"let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1         "在左侧
"let g:tagbar_right = 1        "在右侧
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" a.vim 设置
map <F6> <ESC>:A<RETURN>   "在新Buffer中切换到c\h文件 

"Set mapleader
let mapleader = ","
"Fast editing of .vimrc
map <silent> <leader>e :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" 设置path  在当前文件所在目录、/usr/include目录、当前工作路径中搜索
"set path=.,/usr/include,,
set path=.
if has("win32")
set tags=.\tags
else
set tags+=./tags
endif

"Cscope设置
set cscopequickfix=s-,c-,d-,i-,t-,e-

" vim-snipmate 设置

"打开文件类型检测,关掉智能补全时的预览窗口
filetype plugin indent on
set completeopt=longest,menu

"quickfix 设置
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


"netrw 设置
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>

"echofunc 设置
let g:EchoFuncLangsUsed = ["cpp", "java"] 

"设置 doxygenToolkit
let g:DoxygenToolkit_authorName="Jayden   tjjun@vtron.com"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_licenseTag="Copyright (c) 2010, VTRON All rights reserved.\<enter>"
let g:DoxygenToolkit_commentType = "C++"
let g:doxygen_enhanced_color=1
"map <F10> <ESC>:DoxAuthor<RETURN>      
"map <F11> <ESC>:Dox<RETURN>   
"map <F12> <ESC>:DoxBlock<RETURN>   
"map <F8> <ESC>O/** */<Left><Left> <RETURN>   
"map <F9> <ESC>:DoxUndoc<RETURN>   
"map <F10> <ESC>:DoxLic<RETURN>   

"lookupfile设置
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
    let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lk :LookupFile<cr>   "映射LookupFile为,lk
nmap <silent> <leader>ll :LUBufs<cr>       "映射LUBufs为,ll
nmap <silent> <leader>lw :LUWalk<cr>       "映射LUWalk为,lw

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

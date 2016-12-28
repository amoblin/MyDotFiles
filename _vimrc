"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'isRuslan/vim-es6'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"7.3版开始支持持久撤销
if version >= 703
    set undofile
    set undodir=/tmp
endif
"
"
"MacVim Settings
set guifont=Menlo_Regular:h14
"set guioptions=egmrLtT
set guioptions=egmrLt
"set guifontwide=Hei_Regular:h20
set linespace=2


Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" make backspace work like most other apps
set backspace=2

"encoding of printing. use encoding if not set.
set printencoding=utf-8
"charset of print. should be compatible with printencoding.
set printmbcharset=ISO10646
"打印所用字体, 在linux下, 要用ghostscript里已有的字体, 不然会打印乱码.
set printmbfont=r:UMing,c:yes
"打印可选项, formfeed: 是否处理换页符, header: 页眉大小, paper: 用何种
"纸, duplex: 是否双面打印, syntax: 是否支持语法高
set printoptions=formfeed:y,paper:A4,duplex:on,syntax:y",header:3
"打印时页眉的格式
set printheader=%<%f%h%m%=Page\ %N

"显示行号 set nu/set nonu
set number
"set ruler
"auto change dir
set autochdir
" 设置编码
set enc=utf-8
" 设置文件编码
set fenc=utf-8
" 设置文件编码检测类型及支持格式
set fencs=utf-8,cp936,gbk,gb2312
" 保存文件格式
set fileformats=unix,dos
" 设置切换paste快捷键
set pastetoggle=,sp

" use pathogen
" execute pathogen#infect()

"不使用vi键盘模式，而是使用vim键盘模式
set nocompatible

" Turn backup on
set backup
" Set backup directory
set backupdir=$HOME/.vim/backup/

"设置鼠标可右键复制
"set mouse=v
"set selection=exclusive
set selectmode=key

"set the * register as the default register.
set clipboard=unnamed

" 设定文件浏览器目录为当前目录
set bsdir=buffer
" 指定菜单语言
set langmenu=en_US.UTF-8

" 设置语法高亮度 sy on/sy off
syntax on

"自动换行
"set lbr
"
" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" tab宽度
set expandtab
set tabstop=4
set shiftwidth=4
set cindent shiftwidth=4
set autoindent shiftwidth=4

"设置自动折行 set wrap/set wrap!
set wrap
""不要闪烁，不要蜂鸣 no visual bell, and no beep. oh,yeah!
set novisualbell
"set noerrorbells
set vb t_vb="."

"状态行显示的内容（包括文件类型和解码）
let statusHead='%n:%<%-.50f %h%m%r%y '
let statusFormatEncoding='%{&ff} [%{(&fenc==""?&enc:&fenc).(&bomb?",BOM":"")}] '

"let statusBreakPoint='%<'
"let statusCwd='%-.50{getcwd()}'
" 设置statusEnd"
"let statusModifyTime='%{strftime("%y-%m-%d",getftime(expand("%")))}'
let statusTime='%{strftime("%H:%M")} '
let statusAscii='%o (%b:0x%B) '
let statusRuler='%l,%c%V [%L] %P'
let statusEnd='%=%k'.statusTime.statusAscii.statusRuler
" 最终展示 "
set statusline=%!statusHead.statusFormatEncoding.statusEnd
set laststatus=2
"命令行高度
set cmdheight=1

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Black
"highlight StatusLineNC guifg=Gray guibg=White


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 使用调色板
" 按照时间改变调色板
"colorscheme peachpuff

if version >=703
    set colorcolumn=80
    hi ColorColumn ctermbg=0
end

"colorscheme sublime_style 
"colorscheme torte

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"查找时大小写敏感
"set igsearch

" Enable magic matching
set magic

" Show matching bracets
" 查找结果高亮度显示
set showmatch

" Highlight search things
set hlsearch

" Ignore case when searching
" 查找时若有大写则敏感
"set ignorecase
set smartcase

" Incremental match when searching
" 动态查找 set ic for short
set incsearch

"不循环搜索 no wrap scan
""set nowrapscan

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"自动缩进
"依文件类型自动缩进 
filetype plugin indent on

"继承前一行缩进方式 set ai for short
set autoindent 

" Smart indet
set smartindent

" C-style indeting
set cindent

" Set tabstop width
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set <BS> delete fake tabs
set smarttab

" Insert spaces instead of real tabs
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"自动补全
set completeopt=longest,menu

"括号自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto finding
" set tags=tags;
" 增强检索功能
set tags=./tags,./../tags,./**/tags,../../tags

" Taglist fav
nmap ,, :TlistToggle<cr>
nmap <F2> :TlistToggle<cr>

let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 0
let Tlist_Auto_Update = 1
let Tlist_Auto_Open = 0
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1

" Set compart format
let Tlist_Compart_Format = 1

let Tlist_Exit_OnlyWindow = 1

" Disable auto close
let Tlist_File_Fold_Auto_Close = 0

" Disable fold column
let Tlist_Enable_Fold_Column = 0

let Tlist_WinWidth = 15

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use both cscope and ctag
set cscopetag

" Show msg when cscope db added
set cscopeverbose

" Use tags for definition search first
set cscopetagorder=1

" Use quickfix window to show cscope results
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
" 原则：尽量少使用功能键，太远。使用","开始的二字母组合键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Up> gk
map <Down> gj
map <c-p> :bp<cr>
map <c-n> :bn<cr>
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>

" split in screen
nmap ,s :!screen<cr>

"编译
nmap ,m :make<cr>
nmap ,mr :make run<cr>

"添加时间戳
nmap ,ti O<C-R>=strftime("%c")<CR><Esc>o=<esc>vy34p

" rst文档pygments插件
nmap ,sc I.. code-block:: <Esc>o<ESC>j
nmap ,bs :BlogSave publish<cr>
nmap ,mi bi :math:`<ESC>f<space>i`<ESC>
nmap ,mb I.. math:: <ESC>o<cr>
set pastetoggle=,sp
set showmode

nmap ,t1 o<esc>:execute "normal " . strlen(getline(line(".") - 1))/3*2 . "i="<cr>
nmap ,t2 o<esc>:execute "normal " . strlen(getline(line(".") - 1))/3*2 . "i-"<cr>

map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowPrototypeInAbbr = 1
set completeopt=menu

"""""""""""""""""""""""""""""""""""""""""""
" Make
"""""""""""""""""""""""""""""""""""""""""""
"设置make来更新conky设置
au BufNewFile,BufRead *conkyrc* set makeprg=pkill\ conky&conky\ -c\ %\ 2>~/.conky/%.log&
au BufNewFile,BufRead *conkyrc* set filetype=conkyrc
"设置make来更新openbox配置
au BufNewFile,BufRead rc.xml set makeprg=openbox\ --reconfigure&

"设置json文件为javascript类型
au BufNewFile,BufRead *.json set filetype=javascript

au BufNewFile,BufRead *.md set filetype=mkd

"autocmd
"

let filetype_m = 'objc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
	augroup cprog
		autocmd FileType java,c,cpp,cc,javascript,css,php,pl,sed,awk,sh set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,:// expandtab foldcolumn=4 foldmethod=expr foldexpr=MyFoldfun(v:lnum)
	augroup END
else
	set foldcolumn=4
	"set foldmethod=expr
	set foldexpr=MyFoldfun(v:lnum)
endif


"设置xml文档依缩进折叠
autocmd FileType xml,html,xsl,xhtml,htm,xhtm,svg,xsd,php,python,matlab,vim,coffee set foldmethod=indent

"""""""""""""
" Commet
"""""""""""""
"sh脚本自动注释
let g:BASH_AuthorName='amoblin'
let g:BASH_Email='amoblin@gmail.com'
let g:BASH_Company='bistu'

"c注释
func SetComment()
  call setline(1,"/**************************************************************") 
  call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
  call append(line(".")+1, "*   ") 
  call append(line(".")+2, "*   File Name: ".expand("%:t")) 
  call append(line(".")+3, "*   Author: amoblin <amoblin@gmail.com> ")
  call append(line(".")+4, "*   Create Date: ".strftime("%Y-%m-%d")) 
  call append(line(".")+5, "**********************************************************/") 
endfunc
autocmd FileType c ":call SetComment()"

function GetCount()
    return strlen(substitute(submatch(0)
endfunc

""""""""""""""""""""""""""""""
" c source file settings
""""""""""""""""""""""""""""""

" K&R 风格括号折叠
"
function MyFoldfun(lineNum)

    if getline(a:lineNum)=~'.\+/\*.\+\*/'
        return '='
    elseif getline(a:lineNum)=~'/\*'
        return 'a1'
    elseif getline(a:lineNum)=~'.*\*/'
        return 's1'
    elseif getline(a:lineNum)=~'^ *}.\+{ *$'
		return 's1'
    elseif getline(a:lineNum-1)=~'^ *}.\+{ *$'
		return 'a1'
    elseif getline(a:lineNum)=~'.\+{ *$'
		return 'a1'
    elseif getline(a:lineNum)=~'^ *}.*'
		return 's1'
	elseif getline(a:lineNum)=~' \+case '
		return 'a1'
	elseif getline(a:lineNum+1)=~' \+case ' || getline(a:lineNum+1)=~' \+default:'
		return 's1'
    else
        return '='
    endif
endfunction

""""""""""""""""""""""""""""""""""""
" gdb
""""""""""""""""""""""""""""""""""""
run macros/gdb_mappings.vim

"""""""""""""""""""""""""""""""""""
" wordpress
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
		call append(line(".")+1, "# File Name: ".expand("%")) 
		call append(line(".")+2, "# Author: amoblin <amoblin@gmail.com>") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: ma6174") 
		call append(line(".")+2, "	> Mail: ma6174@163.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
"	if &filetype == 'java'
"		call append(line(".")+6,"public class ".expand("%"))
"		call append(line(".")+7,"")
"	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

""" vimwiki demo
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{'path': '~/Marboo/CC-Wikis/vimwiki/wiki/',
\ 'path_html': '~/Marboo/CC-Wikis/vimwiki/wiki_html',
\ 'html_header': '~/Marboo/CC-Wikis/vimwiki/templates/default.tmpl',}]

"{{{ FileEncode Settings 文件编码,格式

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 检测文件类型
filetype on

" 针对不同的文件类型采用不同的缩进格式
filetype indent on

" 文件修改之后自动载入
set autoread

" 取消备份
set nobackup

" 关闭交换文件
set noswapfile

" 显示竖线
"set colorcolumn=80

" 设置 退出vim后，内容显示在终端屏幕，可以用于查看和复制，不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" encoding dectection 自动判断编码时，依次尝试以下编码:
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set helplang=cn

" 设置新文件的编码为 UTF-8
set encoding=utf-8

" 下面这句只影响普通模式 （非图形界面）下的vim
set termencoding=utf-8

" 开启语法高亮
syntax on

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式，随着键入即时搜索
set incsearch
" 搜索时忽略大小定
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 折叠代码 使用 marker 方式 {{{ 折叠内容 }}}
set foldmethod=marker

" history存储容量
set history=2000
set nocompatible
" disable folding
set nofoldenable
" prompt when existing from an unsaved file
set confirm
" More powerful backspacing
set backspace=indent,eol,start
" Explicitly tell vim that the terminal has 256 colors "
set t_Co=256
" 鼠标暂不启用
set mouse=a
set report=0

" 取消换行 don't wrap lines
set nowrap
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" Remember info about open buffers on close
set viminfo^=%

" 缩进配置 Default Indentation
" 打开自动缩进
set autoindent
" Smart indent
set smartindent     " indent when

" 00x增减数字时使用十进制
set nrformats=

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 是否当前用户可写
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vimrc文件修改之后自动加载。 linux
autocmd! bufwritepost .vimrc source %

"}}}

"{{{ Theme Settings  主题设置
syntax enable
"colorscheme gruvbox
set background=dark
set t_Co=256
autocmd vimenter * ++nested colorscheme gruvbox
let g:molokai_original = 1
let g:rehash256 = 1
set term=screen-256color
"
" 防止tmux下vim的背景色显示异常
if &term =~ '256color'
    set t_ut=
endif

" 突出显示当前行
set cursorline
" 突出显示当前列
set cursorcolumn

" 显示行号
set number

"相对行号
set relativenumber

" 显示当前行号列号
set ruler

" 括号配对情况，跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" change the terminal's title
set title
" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber

" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
"}}}

" {{{ Tab键相关变更
" 设置Tab键宽宽 tab width
set tabstop=4
" 按退格键可以一次删除 4 个空格
set softtabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
set expandtab       " expand tab to space
"}}}

" {{{ 插件安装 vim-plug
call plug#begin()

" gruvbox 配色
Plug 'morhetz/gruvbox'
" vim-airline
Plug 'vim-airline/vim-airline'
" 只输入 vim 时的启动界面
Plug 'mhinz/vim-startify'

call plug#end()
"}}}

"{{{ 插件设置
" vim-airline 设置
let g:airline_powerline_fonts = 1
"}}}

" {{{ 快捷键设置
nmap  <D-/> :
nnoremap <leader>a :Ack
" 快速全选
nnoremap <leader>v V`]

"跳转最后一行
nnoremap <CR> G
"跳转首行
nnoremap <BS> gg

"用jj取代ESC键
inoremap jj <ESC>

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" w!! to sudo & write a file 强制保存
cmap w!! %!sudo tee >/dev/null %

" F1 取消帮助提示
noremap <F1> <Esc>

" F2 粘贴
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" F7 开关行号显示，方便复制
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F7> :call HideNumber()<CR>

" F8 开关语法高亮
nnoremap <F8> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
"}}}

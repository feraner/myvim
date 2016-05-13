"enter 自动运行 php 命令
autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>  
set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

 
"let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

Bundle 'vim-scripts/taglist.vim'

Bundle 'tomasr/molokai'
"Bundle 'amadeus/vim-evokai'
"Bundle 'cesardeazevedo/Fx-ColorScheme'

Plugin 'php.vim'                                    "如果下载文件，用Plugin 来加载插件


call vundle#end()
 
filetype plugin indent on                             " required!


"===========================================  编辑基础配置====================

filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
set smartindent                                       "启用智能对齐方式
"set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set list                                              "显示特殊字符
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set hlsearch                                          "设定搜索高调度反白
set background=dark
syntax on                                             "打开色彩高亮

"set number                                           "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=1                                       "设置命令行的高度为2，默认为1
set cursorline                                       "突出显示当前行

set nobackup                                            "设置无备份文件
set noswapfile                                          "设置无临时文件
set vb t_vb=                                            "关闭提示音
"关闭兼容模式 backspace 能用
set nocompatible                                         
set backspace=2


"================================= 编码配置=======================
set encoding=utf-8                                    "设置vim内部编码，默认不更改
set fileencoding=utf-8                                "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码

set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

"=============================== 个性配置========================
set listchars=tab:−−,trail:•


"======================= NERDTree Config=====================
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinPos='left'
let NERDTreeChDirMode=1
"autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"====================== colorscheme molokai =============
set guifont=Consolas:h12
set t_Co=256
colorscheme molokai



"=======================syntastic=======================
"phpcs，tab 4个空格，编码参考使用Zend风格                                                                                       
"let g:syntastic_phpcs_conf = "-n --tab-width=4 --standard=Zend"
"let g:syntastic_check_on_open = 1                       "每次打开buffer就执行检测
"let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
"let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_loc_list=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0





"========================== phpcomplete ====================
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
nnoremap <C-k> <C-w><C-]><C-w>T  






"========================SirVer/ultisnips===================
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"设置代码片的位置
"let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'




"===========================taglist ========================
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "order"
let Tlist_Show_One_File=1                               "只显示一个文件的内容
"打开/关闭taglist列表
nmap <F10> :TlistToggle<CR>                                   


"============================youcompleteme ==================
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
set completeopt=longest,menu                                "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif     "离开插入模式后自动关闭预览窗口
let g:ycm_complete_in_comments = 1                          "在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
let g:ycm_confirm_extra_conf=0                              "关闭加载.ycm_extra_conf.py提示






"=========================m窗口快捷跳转============
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

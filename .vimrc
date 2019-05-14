set nocompatible
set encoding=utf-8
set completeopt-=preview
filetype off
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'mattn/emmet-vim'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'heavenshell/vim-jsdoc'
" 美化状态栏 和 主题
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'othree/yajs.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

syntax enable
syntax on       " 开启语法高亮
set t_Co=256
colorscheme monokai        " murphy 设置配色方案i
set background=dark

set cindent
set hlsearch               " 搜索逐字符高亮
set incsearch
set showmatch              " 高亮显示匹配的括号
set cursorline    " 高亮显示当前 - 行

set nu
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround  

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
 
" 设置状态栏主题风格
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_powerline_fonts=1

set pastetoggle=<F9>
set completeopt-=preview
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
filetype off                  " required
syntax enable

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    ¦   exec "w"
    ¦   if &filetype == 'c'
    ¦   ¦   ¦   exec '!g++ % -o %<'
    ¦   ¦   ¦   "exec '!time ./%<'
    ¦   elseif &filetype == 'cpp'
    ¦   ¦   ¦   exec '!g++ % -o %<'
    ¦   ¦   ¦   "exec '!time ./%<'
    ¦   elseif &filetype == 'python'
    ¦   ¦   ¦   exec '!python %'
    ¦   ¦   ¦   "exec '!time python %'
    ¦   elseif &filetype == 'sh'
    ¦   ¦   ¦   :!bash %
    ¦   ¦   ¦   ":!time bash %
    ¦   endif
endfunc

let mapleader=','
map <F4> <leader>ci <CR>

" vim-go custom mappings
"au FileType go nmap <Leader>s <Plug>(go-implements)
"au FileType go nmap <Leader>i <Plug>(go-info)
"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)
"au FileType go nmap <Leader>ds <Plug>(go-def-split)
"au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"au FileType go nmap <Leader>dt <Plug>(go-def-tab)
"au FileType go nmap <Leader>e <Plug>(go-rename)

"let g:go_fmt_command = "goimports"

"add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

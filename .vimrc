"窗口分割导航
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"nnoremap <A-Up> ddP
"nnoremap <A-Down> ddp
nmap <A-Down> mz:m+<cr>`z
nmap <A-Up> mz:m-2<cr>`z
vmap <A-Down> :m'+<cr>`<my>mzgv`yo`z
vmap <A-Up> :m'<-2<cr>`>my`<mzgv`yo`z</cr>

"缓冲区buffer
"ls 查看缓冲区
"b num 选择缓冲区

"代码折叠
set foldmethod=indent
set foldlevel=99
"nnoremap <space> za

set number "设置行号"
set tabstop=4 "让一个tab等于4个空格
set expandtab
set shiftwidth=4
set softtabstop=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set vb t_vb=
set encoding=utf-8

set nowrap "不自动换行
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
set noswapfile
set cursorline "hilight
hi CursorLine cterm=NONE ctermbg=black

"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlvim/ctrlp.vim' 
Plugin 'tacahiroy/ctrlp-funky'

"html
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
"Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'

""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

"tagbar
Plugin 'majutsushi/tagbar'

"tab buffer
Plugin 'fholgado/minibufexpl.vim'

Plugin 'bling/vim-airline'

"show indent
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"show indent
"let g:indent_guides_auto_colors = 0
"set background=light
"let g:indent_guides_enable_on_vim_startup = 1

"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"YCM配置
"让YouCompleteMe同时利用原来的ctags
let g:ycm_collect_identifiers_from_tag_files = 1
"tags设置
set tags+=~/.vim/tags/systags

let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_autoclose_preview_window_after_completion=1 "自动补全窗口不会消失
nnoremap <C-F12> :YcmCompleter GoToDeclaration<CR>
nnoremap <F12> :YcmCompleter GoToDefinition<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_confirm_extra_conf = 1

"syntastic
let g:syntastic_error_symbol = '?'  "set error or warning signs
let g:syntastic_warning_symbol = '?'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker='flake8,pyflakes,pep8,pylint'
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" make backspaces more powerfull
set backspace=indent,eol,start

"NERDTree设置
map <F3> :NERDTree<CR> 打开目录树
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=35
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1 
let NERDTreeIgnore=['\~$', '\w*.o$', '\w*.a$']

"MiniBufExplorer 设置
let g:miniBufExplMaxSize = 2
let g:miniBufExplMapWindowNavArrows = 1 "是用<C-箭头键>切换到上下左右窗口中去

"tagbar set
let g:tagbar_ctags_bin='ctags'            "ctags程序的路径
let g:tagbar_width=30                    "窗口宽度的设置
map <F4> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启

"airline
set laststatus=2

"omnicppcomplete
filetype plugin indent on
set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2     " search namespaces in the current buffer   and in included files
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1    " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]"]

"CtrlP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

"Complile
map <F7> :call CompileGCC()<CR>
func!CompileGCC()
    exec "w"
    exec "make debug=y"
endfunc

inoremap <F6> //---------------------------------------------------------------------------
nnoremap <C-F6> :call setline('.', "//---------------------------------------------------------------------------")<CR>'s
"进行版权声明的设置
"添加或更新头
"map <F8> :call TitleDet()<cr>'s
"function AddTitle()
"    call append(0,"/*=============================================================================")
"    call append(1,"#")
"    call append(2,"# Author: chenjianyu")
"    call append(3,"#")
"    call append(4,"# QQ : 313720180")
"    call append(5,"#")
"    call append(6,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
"    call append(7,"#")
"    call append(8,"# Filename: ".expand("%:t"))
"    call append(9,"#")
"    call append(10,"# Description: ")
"    call append(11,"#")
"    call append(12,"=============================================================================*/")
"    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
"endf
""更新最近修改时间和文件名
"function UpdateTitle()
"    normal m'
"    execute '/# *Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
"    normal ''
"    normal mk
"    execute '/# *Filename:/s@:.*$@\=":\t".expand("%:t")@'
"    execute "noh"
"    normal 'k
"    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
"endfunction
""判断前10行代码里面，是否有Last modified这个单词，
""如果没有的话，代表没有添加过作者信息，需要新添加；
""如果有的话，那么只需要更新即可
"function TitleDet()
"    let n=1
"    "默认为添加
"    while n < 10
"        let line = getline(n)
"        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
"            call UpdateTitle()
"            return
"        endif
"        let n = n + 1
"    endwhile
"    call AddTitle()
"endfunction

"========================================================================
"taglist设置
"let Tlist_Show_One_File=1    " 只展示一个文件的taglist
"let Tlist_Exit_OnlyWindow=1  " 当taglist是最后以个窗口时自动退出
"let Tlist_Use_Right_Window=1 " 在右边显示taglist窗口
"let Tlist_Sort_Type="name"   " tag按名字排序
"let Tlist_Auto_Open=1 	"自动打开
"map <C-F11> :TlistToggle<CR>





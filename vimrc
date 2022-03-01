set modelines=0" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible" Use Vim defaults instead of 100% vi compatibility
set backspace=2" more powerful backspacing
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

set nu
"编码设置
"utf-8编码
" 设置编码
set enc=utf-8
" 设置文件编码
set fenc=utf-8
" 设置文件编码检测类型及支持格式
set fencs=gbk,utf-8,ucs-bom,gb18030,gb2312,cp936
language messages zh_CN.utf-8

set encoding=utf-8
set fileencodings=ucs-bom,utf8,chinese,taiwan,ansi
set termencoding=utf-8

" 不要备份文件（根据自己需要取舍）
set nobackup

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

"Use the dictionary completion
set complete-=k complete+=k

function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
                return "\<TAB>"
                    else
    return "\<C-N>"
    endif
endfunction

"Remap the tab key to select action with InsertTabWrapper
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

"TAB缩进设置===============
set expandtab
"set sw=4
set et sw=4 ts=4 sts=4
set tabstop=4
set softtabstop=4

" plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'rust-lang/rust.vim'

Plugin 'racer-rust/vim-racer'

Plugin 'git@github.com:zyxxoo/nerdtree.git'

Plugin 'git@github.com:altercation/vim-colors-solarized.git'

Plugin 'nerdtree-ack'

Plugin 'mileszs/ack.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"ctrip search quick
Plugin 'git@github.com:kien/ctrlp.vim.git'


call vundle#end()
filetype plugin indent on

set hidden
let g:racer_cmd="~/.cargo/bin/racer"
let g:racer_experimental_completer=1
let $RUST_SRC_PATH="~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized 

"nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowBookmarks=1
map <F2> :NERDTreeToggle

" airline config
let g:airline_theme="solarized"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|jpeg)$',
  \ }

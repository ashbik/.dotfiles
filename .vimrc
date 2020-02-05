" defaults are set in $VIMRUNTIME/archlinux.vim (/usr/share/vim/vimfiles/archlinux.vim) 

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
:set number relativenumber
:set nu rnu
set nocompatible
filetype plugin on
syntax on

"Replace tab with space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" git 
inoremap g<Enter><Enter> <Esc>:w<Enter> <Esc>:!clear;/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME add %<Enter><Enter><Esc>:!/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME commit -m "Auto updated using vim (see .vimrc for details.)" <Enter><Enter><Esc>:!/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME push -u origin master<Enter> 



"autosave
autocmd TextChanged, TextChangedI <buffer> silent write


" Jump-point
inoremap <Space><Space><Tab> <Esc>/<++><Enter>"_c4l

" Run python code on terminal
autocmd FileType python inoremap r<Enter><Enter> <Esc>:%s/<++>//g<Enter><Esc>:w<Enter><Esc>:!clear;python %<Enter>

"Comment python code
autocmd FileType python inoremap ## <Esc>0i#<Esc>j 

" Autocomplete Brackets and quotes
autocmd FileType python inoremap " ""<Esc>i
autocmd FileType python inoremap ' ''<Esc>i 
autocmd FileType python inoremap ( ()<Esc>i


autocmd FileType python inoremap "" "
autocmd FileType python inoremap '' ' 
autocmd FileType python inoremap (( ( 

" Generate statements
autocmd FileType python inoremap ;p print(i)<Enter><++><Esc>Fixi

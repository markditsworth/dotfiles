set nocompatible              " be iMproved, required
filetype off                  " required

" yml/yaml, 2 spaces
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins here
Plugin 'JuliaEditorSupport/julia-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

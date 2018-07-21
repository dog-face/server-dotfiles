set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" added by mznco
colo Tomorrow-Night-Bright
syntax on

" Show line numbers
set number
" Also show relative line numbers
set relativenumber

" Enable mouse
se mouse+=a

filetype plugin indent on
" Tab characters are 4 spaces wide
set tabstop=4
" when indenting with '>', use 4 spaces width (a single tab as above)
set shiftwidth=4
" On pressing tab, insert 4 spaces
set softtabstop=4 expandtab
" Automatically indent new lines to match parent
set autoindent
" Allow backspace to delete these indents
set backspace=indent,eol,start

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Press F2 to enter paste mode, press it again to exit
set pastetoggle=<F2>

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

" UTF-8 Encoding
set encoding=utf-8

" Tab controls
nnoremap tp         :tabprevious<CR>
nnoremap tn         :tabnext<CR>
nnoremap <C-t>      :tabnew<CR>

" Paste last yanked
nnoremap [  "0p
nnoremap {  "0P

" Start NERDTree
autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" tt to show/hide nerdtree
map tt :NERDTreeToggle<CR>

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Pretty Python code
let python_highlight_all=1
syntax on

" Return to last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

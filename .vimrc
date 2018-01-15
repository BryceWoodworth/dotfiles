set nocompatible

" Vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  " Can use Vundle to configure and keep Vundle up-to-date once it is installed
  " for the first time
  Plugin 'gmarik/Vundle.vim'

  " Extra plugins, which can be configured with Vundle commands
  " like :PluginInstall
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'Valloric/MatchTagAlways'
  Plugin 'vim-scripts/netrw.vim'
  Plugin 'tpope/vim-sensible'
  Plugin 'SirVer/ultisnips'
  Plugin 'fugitive.vim'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'google/vim-maktaba'
  Plugin 'google/vim-codefmt'
  Plugin 'google/vim-glaive'
  " Plugin 'Syntastic'
  " Plugin 'honza/vim-snippets'

  call vundle#end()
  call glaive#Install()
else
  echomsg 'Vundle is not installed. You can install Vundle from'
      \ 'https://github.com/VundleVim/Vundle.vim'
endif
filetype plugin indent on

" Common stuff
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase

set encoding=utf-8

set belloff=all
set cursorline
set background=dark

" Show line numbers
set number

" Use » to mark Tabs and ° to mark trailing whitespace.
set list listchars=tab:»\ ,trail:°

" Highlight the search term when you search for it.
set hlsearch

" Enable syntax highlighting
syntax enable

" Set comma s the leader
let mapleader=','

" Highlight characters over column 100
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" Don't jump on *
nnoremap * :keepjumps normal! mi*`i<CR>

" Easier write and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Easy way to clear highlighting
nnoremap <Ctrl-l> :noh<CR><C-l>

" Automatically change the working path to the path of the current file
augroup cdgroup
  autocmd!
  autocmd BufNewFile,BufEnter * silent! lcd %:p:h
augroup END

" Set up code formatting
augroup autoformat
  autocmd!
  " Autoformat BUILD files on write.
  autocmd FileType bzl AutoFormatBuffer buildifier
  " Autoformat go files on write.
  autocmd FileType go AutoFormatBuffer gofmt
  " Autoformat proto files on write.
  autocmd FileType proto AutoFormatBuffer clang-format
  " Autoformat c/c++ files on write.
  autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END

" TODO: find a way to make better mappings for history search in : mode

" Syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Solarized config
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" Map ; to : to cut down on chording
nnoremap ; :

" Make escaping insert mode easier
inoremap ;; <Esc>

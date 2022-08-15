"Autocmd groups for filetypes and loading {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType vim nnoremap <buffer> <localleader>f Vatzf
augroup END

au BufNewFile,BufRead *.cell set filetype=fortran

augroup load_file
     autocmd BufRead * :let @/ = ""
augroup END

augroup filetype_fortran
     autocmd!
     autocmd FileType fortran nnoremap <buffer> <localleader>c I!<esc>
augroup END

augroup filetype_python
     autocmd!
     autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END

augroup filetype_tex
     autocmd!
     autocmd FileType tex nnoremap <buffer> <localleader>c I%<esc>
augroup END
augroup filetype_bash
     autocmd!
     autocmd FileType sh nnoremap <buffer> <localleader>c I#<esc>
augroup END
"}}}

"Basic settings (tabsize, clipboard,etc) {{{
set number
set hlsearch incsearch
set relativenumber
set tabstop=5
set shiftwidth=5
set expandtab
set background=dark
set clipboard=unnamedplus
set encoding=utf-8
set wildmenu
set ttyfast
syntax enable
set updatetime=1000
"}}}

"Mappings {{{
"Change splits faster
let mapleader=" "

"Delete lines
noremap - dd

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"Enter new line in insert mode
inoremap <C-o> <Esc>o
inoremap <C-O> <Esc>O

"Go to end of line in insert mode
inoremap <C-A> <Esc>A

"Quickfix window stuff
nnoremap <silent><leader>cn :cn<CR>
nnoremap <silent><leader>cp :cp<CR>

"Rebind escape to jk
inoremap jk <esc>

"Move to start or end of line in normal mode
nnoremap L $
nnoremap H 0

"Delete a line in insert mode
inoremap <C-d> <esc> ddi

"Uppercase  word in insert mode
inoremap <C-u> <esc> viw U  
inoremap <C-e> <esc> viw u

"Edit vimrc, zshrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sz :!source ~/.zshrc<CR>

"Change buffers
nnoremap <leader>b1 :b 1<CR>
nnoremap <leader>b2 :b 2<CR>
nnoremap <leader>b3 :b 3<CR>
nnoremap <leader>b4 :b 4<CR>
nnoremap <leader>b5 :b 5<CR>
nnoremap <leader>b6 :b 6<CR>
nnoremap <leader>b7 :b 7<CR>
nnoremap <leader>b8 :b 8<CR>
nnoremap <leader>b9 :b 9<CR>
nnoremap <leader>b10 :b 10<CR>
nnoremap <leader>bd :bd<CR>

"Live preview for LaTex
noremap <leader>lp :LLPStartPreview<CR>

"Close brackets for different types
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

"Gfortran compilation
nnoremap <leader>gf :!gfortran -Wall -fcheck=all -fmax-errors=1 -O3 -march=native -o 

"Put word in speech marks
inoremap <C-s> <esc>bi"<esc>ea"

" Changes how to save and quit
nnoremap <Leader>w :w<ESC>
nnoremap <Leader>z :wq<CR>

"Nerdtree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"}}}

"Plugins installed using plugged {{{
filetype plugin indent on
execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'preservim/nerdtree'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()
"}}}

"UltiSnip stuff {{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"}}}

"Toggle fold column{{{
nnoremap <leader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
     if &foldcolumn
          setlocal foldcolumn=0
     else
          setlocal foldcolumn=4
     endif
endfunction
"}}}

"Quickfix toggle{{{

nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
     if g:quickfix_is_open
          cclose
          let g:quickfix_is_open = 0
          execute g:quickfix_return_to_window . "wincmd w"
     else
          let g:quickfix_return_to_window = winnr()
          copen
          let g:quickfix_is_open = 1
     endif
endfunction

"}}}

nnoremap <F5> :GundoToggle<CR>

"Vimtex settings {{{
set conceallevel=1
let g:tex_conceal='abdmg'

"Sets vimtex default reader
let g:vimtex_view_general_viewer = 'okular'
let maplocalleader = "\\"

"Fold shit for latex
let g:vimtex_fold_enabled = 1
let g:vimtex_syntax_conceal_disable = 1
set fillchars=fold:\ 
"}}}

"Airline themes {{{
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

"Airline buffer stuff at top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"}}}

"Aesthetics {{{
set termguicolors

"Changed to solarised8
colorscheme solarized8

"Highlights folds in black and white so it's actually readable
hi Folded cterm=NONE ctermfg=Black ctermbg=white guifg=Black guibg=White
hi Search cterm=NONE guifg=Black guibg=white

"Gitgutter colours
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

"Changes cursor type for insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

highlight LineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=White guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=White guibg=NONE
highlight SignColumn term=bold cterm=NONE ctermfg=White ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"Toggles highlighting for search
nnoremap <silent> _ :nohl<CR>
"}}}

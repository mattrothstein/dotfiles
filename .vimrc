syntax on
filetype plugin on
filetype indent on

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
:command! -bar -bang Q quit<bang>

cabbrev nt NERDTree
cabbrev ct ConqueTerm bash
cabbrev cts ConqueTermSplit bash
cabbrev ctv ConqueTermVSplit bash
cabbrev ctr ConqueTerm rails c

set ruler
set number
set splitright splitbelow
set expandtab shiftwidth=2 tabstop=2 softtabstop=2
set backspace=indent,eol,start
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
set nofoldenable

syntax enable
colorscheme dracula
hi StatusLine ctermbg=1
hi Comment guifg=#1abc9c

autocmd BufWritePre * %s/\s\+$//e
:set ignorecase

:set mouse=a

let g:rspec_command = "!bundle exec rspec {spec}"
let g:airline_powerline_fonts = 1
let g:ackprg = 'ag --vimgrep'
let g:NERDTreeWinSize=60
let NERDTreeShowHidden=1

vnoremap <space>p "_dP

map <Space>ve :e ~/.vimrc<CR>
map <Space>so :so ~/.vimrc<CR>
map <Space>sf :call RunCurrentSpecFile()<CR>
map <Space>ns :call RunNearestSpec()<CR>
map <Space>rb :Dispatch rubocop %<CR>
map <Space>ff :FZF<CR>
map <Space>gb :Gblame<CR>
map <Space>nt :NERDTreeToggle<CR>
map <Space>nf :NERDTreeFind<CR>
map <Space>bb :ls<CR>
map <Space>as :AS<CR>
map <Space>a  :A<CR>
map <Space>rs :RS<CR>
map <Space>r  :R<CR>
map <Space>vs :vsplit<CR>
map <Space>hs :split<CR>
map <Space><Tab> :b#<CR>
map <Space>frt :Frt<CR>
map <Space>avs :AVS<CR>

if exists('g:loaded_dash')
  finish
endif
let g:loaded_dash = 1

function! s:Dash(search)
  exec 'silent !open "dash://' . join(split(a:search), ':') . '"'
  redraw!
endfunction

command! -bar -nargs=+ Dash call s:Dash(<q-args>)
nnoremap <Space>dd :Dash <C-R>=&filetype<CR> <cword><CR>

"FIX STICKY SHIFT"
map :Q :q
map :W :w

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

:command AVS :vsplit<CR> :A<CR>
:command Frt :normal gg O# frozen_string_literal: true<CR><ESC>x

autocmd StdinReadPre * let s:std_in=1
autocmd QuickFixCmdPost *grep* cwindow
autocmd filetype crontab setlocal nobackup nowritebackup

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('haml', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('rb', 'Magenta', 'none', '#ff00ff', '#151515')


"=============== Vundle, start ===============

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'wkentaro/conque.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/dbext.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-system-copy'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/vim-easy-align'
Plugin 'rking/ag.vim'
Plugin 'dracula/vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'rizzatti/dash.vim'
call vundle#end()            " required

filetype plugin indent on    " required

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" higlight the line where the cursor is
set cursorline
" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Markdown support
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.markdownd set filetype=markdown
au BufRead,BufNewFile *.conf set filetype=conf
au BufRead,BufNewFile *.hcl set filetype=tf set tabstop=4
" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" attempt to show whitespaces
set listchars=eol:¶,tab:->,trail:.,extends:>,precedes:<
set list
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
"filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set wrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700
" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
nmap <silent> <F3> <Esc>:set noexpandtab<CR>
nmap <silent> <F4> <Esc>:set expandtab<CR>

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


""" vundle ... IDE-like intellisense
set nocompatible               " be iMproved required for eclim
"filetype on                   " required!
filetype plugin indent on
"let g:EclimCompletionMethod = 'omnifunc'

" set rtp+=~/.vim/vundle.git/
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
call vundle#begin()
" call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle
" Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'

"
" original repos on github
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'vim-scripts/vcscommand.vim'


" org-mode...
"Plugin 'hsitz/VimOrganizer'
Plugin 'jceb/vim-orgmode'
"Plugin 'vim-scripts/speeddating.vim'

" vim-scripts repos
"Plugin 'L9'
"Plugin 'FuzzyFinder'
Plugin 'rails.vim'
Plugin 'neilus/vim-creole'
Plugin 'vim-scripts/VimClojure'
Plugin 'vim-scripts/taglist.vim'
"""Plugin 'vim-scripts/vimwiki'
"""Plugin 'vim-scripts/vim-wakatime'
"""Plugin 'wakatime/vim-wakatime'
" non github repos
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"""Plugin 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
" or
" filetype plugin on          " to not use the indentation settings set by plugins


"" YCM aka intellisense
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
"Plugin 'ervandew/eclim'
"Plugin 'pwicks86/eclim-for-vundle'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'elzr/vim-json'

au! BufRead,BufNewFile *.json set filetype=json

Plugin 'scrooloose/syntastic'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
" " https://python-guide.readthedocs.org/en/latest/dev/env/
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{FugitiveStatusline()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

"" as python IDE
Plugin 'Lokaltog/vim-powerline'
set laststatus=2
" Settings for ctrlp
" cd ~/.vim/bundle
Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
"""execute pathogen#infect()
""" Compiler output
Plugin 'mfukar/robotframework-vim'
call vundle#end()

""" Ruby and Vagrantfile
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Berksfile set filetype=ruby
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy
set encoding=utf-8

" Plugin 'psf/black' # no module found ERROR

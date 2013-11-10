
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

" whitespaces?
"highlight Search cterm=underline gui=underline ctermbg=233 guibg=none ctermfg=none guifg=none
"set hls
"let g:HLSpace = 1
""let g:HLColorScheme = g:colors_name
"
"function ToggleSpacesWithUnderscors()
"    if g:HLSpace
"        highlight Search cterm=underline gui=underline ctermbg=233  guibg=none ctermfg=none guifg=none
"        let @/ = " "
"      else
"        highlight clear
"        silent colorscheme "".g:HLColorScheme
"        let @/ = ""
"    endif
"    let g:HLSpace = !g:HLSpace
"endfunction
"nmap <silent>  <F3> <Esc>:call ToggleSpacesWithUnderscors()<CR>

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
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
"set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}


" org-mode...
"Bundle 'hsitz/VimOrganizer'
Bundle 'jceb/vim-orgmode'
Bundle 'vim-scripts/speeddating.vim'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'
Bundle 'neilus/vim-creole'
Bundle 'vim-scripts/VimClojure'
Bundle 'vim-scripts/taglist.vim'
"""Bundle 'vim-scripts/vimwiki'
"""Bundle 'vim-scripts/vim-wakatime'
"""Bundle 'wakatime/vim-wakatime'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"""Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

"" YCM aka intellisense
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
Bundle 'ervandew/eclim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'elzr/vim-json'

au! BufRead,BufNewFile *.json set filetype=json

Bundle 'scrooloose/syntastic'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
" " https://python-guide.readthedocs.org/en/latest/dev/env/
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

"" as python IDE
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
" Settings for ctrlp
" cd ~/.vim/bundle
Bundle 'kien/ctrlp.vim'
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
Bundle 'scrooloose/syntastic'

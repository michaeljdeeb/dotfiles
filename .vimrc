" Run vim-pathogen as a submodule
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim 
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " Turns off compatible mode for when not running from ~/.vimrc    
filetype indent plugin on       " Enables file type detection for syntax highlighting and 
                                " allows language specific indentation at
                                " ~/vim/indent/<language>.vim
                                " plugin is required for NERDcommenter
set history=1000
set undofile                    " Persistent log of undos after opening/closing
set undodir=~/.vim/.un//        " Centralize undo files (.un) // means complete path will be built here based on file location
set directory=~/.vim/.swp//     " Centralize swap files
set backupdir=~/.vim/.backup//  " Centralize backup files (used before overwriting)
set scrolloff=3                 " Show x lines above the cursor when file is scrollable
set visualbell                  " Stops beeps for incorrect input
set modelines=0                 " Prevents modeline security vulnerability
set encoding=utf-8              " The encoding displayed by vim
set fileencoding=utf-8          " The encoding written to file
set ttyfast                     " Improves smoothness of redrawing (Fast terminal connection)
set tabstop=2                   " Indentation width for existing tab characters
set softtabstop=2               " Indentation width for tab key
set shiftwidth=2                " Indentation width for operations such as << or >>
set expandtab                   " Converting hard tabs to soft tabs (spaces)
set autoindent
set backspace=indent,eol,start  " Makes backspace behave like you would expect
                                " indent: allows backspacing vim's autoindent
                                " eol: allows deletion of eol markers with backspace
                                " start: deletion of text inserted during the current insert session only
set hidden                      " Allows you to open a new file without writing out current changes
set ruler                       " Enables ruler (status bar) at the bottom of the page
set laststatus=2                " Always show status bar
set number                      " Enables line numbers
set relativenumber              " Line numbers relative to cursor (Real line number shown at cursor)
set showtabline=2               " Always show line with tab page labels
set wildmenu                    " Enable autocomplete menu
set wildmode=list:longest       " Complete longest common string, then list alternatives
set incsearch                   " Search as you type
set hlsearch                    " Highlight all matches in the file
set ignorecase smartcase        " Searches are case-sensitive if they contain an upper-case letter
set showmatch                   " When creating a new bracket pair, the cursor will flash the matching one
set foldenable                  " Enable folding
" set foldmethod=indent          " Fold lines with the same level of indentation
set wrap                        " Wrap lines longer than the window
set linebreak                   " Wrap lines in sensible places
set breakindent                 " Indent wrapped lines to match the beginning of the line
set splitbelow                  " Helps preview window be placed below current window
set spelllang=en                " Use English to spell check words
" Use custom spell file to add words vim doesn't have
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell                       " Enable spell check at runtime

""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme & Color Depth
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                   " Syntax highlighting
set cursorline                  " Highlights current line
" Highlight the 100th & up character of the line
let &colorcolumn=join(range(101,999),",") 
set t_Co=256                    " Enable 256-color depth

" Enables 24-bit color depth (requires compatible terminal/vim 8+)
" if (has("termguicolors"))
"  set termguicolors	
" endif
" Required for 24-bit color tmux
" if &term =~# '^screen'
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
set t_ut=                       " Disable BCE for tmux
let g:solarized_termcolors=16
let g:solarized_contrast='high'
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-in Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1             " Tell airline to use powerline symbols
let g:airline#extensions#branch#enabled = 1   " Show git branch in airline
let NERDTreeShowHidden = 1                    " Show hidden files in NERDTree
let NERDTreeMinimalUI = 1                     " Remove Press ? for help in NERDTree
let g:NERDTreeShowIgnoredStatus = 1           " Mark .gitignore files as such (may slowdown vim?)
" Makes multi-line comments start with /** per Airbnb style guide
let g:NERDCustomDelimiters = {'javascript': {'left': '//', 'leftAlt': '/**', 'rightAlt': '*/'}} 
let g:NERDSpaceDelims = 1                     " One space before comment per Airbnb style guide
let g:ale_sign_column_always = 1              " Keep sign gutter always open
" tmux doesn't like these symbols so let's not use them
" let g:ale_sign_error = '✖︎'                    " Custom error sign
" let g:ale_sign_warning = '⚠︎'                  " Custom warning sign
" Only lint using eslint
let g:ale_linters = {'javascript': ['eslint']}
let g:ycm_autoclose_preview_window_after_completion = 1 " Close preview window when not in use
let g:vimwiki_list = [{'path': '$HOME/Developer/wiki', 'syntax': 'markdown', 'ext': '.md'}] " Set a location for the wiki and use markdown syntax 

""""""""""""""""""""""""""""""""""""""""""""""""""
" Remappings
" NOTE: Don't include comments next to mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Press return to remove highlighting from search
nnoremap <CR> :nohlsearch<CR><CR>
" Press tab to match bracket pairs (% is difficult to type and this seems useful)
nnoremap <tab> %
vnoremap <tab> %
" Don't use the arrow keys, in any mode, ever
nnoremap <up> <nop>
inoremap <up> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
inoremap <left> <nop>
nnoremap <right> <nop>
inoremap <right> <nop>
" Move up and down screen lines, not file lines
nnoremap j gj
nnoremap k gk
" ; does the same thing as shift+;
nnoremap ; :
" Use jj to exit insert mode
inoremap jj <esc>
" Toggle NERDTree
map <C-\> :NERDTreeToggle<CR>
" In normal mode, // will toggle the comment of the current line
" This also works to uncomment multi-line comments using any line
nmap // <Leader>c<Space>
" In visual mode, // will comment out selected lines with pretty formatting
vmap // <Leader>cs

""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-Commands
""""""""""""""""""""""""""""""""""""""""""""""""""
" Save files when vim loses focus (this might not work with tmux)
" autocmd FocusLost * :wa
" Open NERDTree pane ONLY if no file was specified (just type vim)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Automatically close vim if NERDTree is the only window open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Prepopulate vimwiki diary with questions each day
autocmd BufNewFile */diary/????-??-??.md call s:new_vimwiki_diary_template()


""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""
" Prepopulate vimwiki diary with questions each day
function s:new_vimwiki_diary_template()
  " load template
  read $HOME/Developer/wiki/templates/diary.md | execute "normal ggdd"
  " Replace h1 with today's date
  %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
endfunction

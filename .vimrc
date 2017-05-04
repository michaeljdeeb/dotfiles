" Run vim-pathogen as a submodule
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim 
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " Turns off compatible mode for when not running from ~/.vimrc    
filetype indent on              " Enables file type detection for syntax highlighting and 
                                " allows language specific indentation at
                                " ~/vim/indent/<language>.vim
set history=1000
set undofile                    " Persistent log of undos after opening/closing
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
"set foldmethod=indent          " Fold lines with the same level of indentation
set wrap                        " Wrap lines longer than the window
set linebreak                   " Wrap lines in sensible places
set breakindent                 " Indent wrapped lines to match the beginning of the line

""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme & Color Depth
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                   " Syntax highlighting
set cursorline                  " Highlights current line
" Highlight the 100th & up character of the line
let &colorcolumn=join(range(101,999),",") 
colorscheme base16-oceanicnext
set t_Co=256                    " Enable 256-color depth
" Enables 24-bit color depth (requires compatible terminal/vim 8+)
if (has("termguicolors"))
  set termguicolors	
endif
" Required for 24-bit color tmux
if &term =~# '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set t_ut=                       " Disable BCE for tmux

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-in Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1             " Tell airline to use powerline symbols
let g:airline#extensions#branch#enabled = 1   " Show git branch in airline
let NERDTreeShowHidden = 1                    " Show hidden files in NERDTree
let g:ale_sign_column_always = 1              " Keep sign gutter always open
let g:ale_sign_error = '⨉'                     " Custom error sign
let g:ale_sign_warning = '⚠'                   " Custom warning sign
" Only lint using eslint
let g:ale_linters = {
\  'javascript': ['eslint'],
\}

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-Commands
""""""""""""""""""""""""""""""""""""""""""""""""""
" Save files when vim loses focus
autocmd FocusLost * :wa    
" Open NERDTree automatically
autocmd vimenter * NERDTree 
" Place the cursor in the main window instead of NERDTree
autocmd vimenter * wincmd p 
" Automatically close vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

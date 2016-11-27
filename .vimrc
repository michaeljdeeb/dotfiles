" Migration Notes:
	" ~/.vimrc
	" ~/.vim/:
		" ~/.vim/colors/

" Running pathogen from a non-default directory
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set t_Co=256        " Enable 256-colors
if (has("termguicolors"))
  set termguicolors	" Enables 24-bit color depth (requires compatible terminal/vim 8+)
endif

set nocompatible    " Turns off compatible mode when not running from ~/.vimrc    
filetype indent on	" Enables file type detection for syntax highlighting and 
										" allows language specific indentation at
										" ~/vim/indent/python.vim
" set hidden        " Allows you to open a new file without writing out current changes
set history=1000

set tabstop=2	 			" Indentation width for existing tab characters
set softtabstop=2		" Indentation width for tab key
set shiftwidth=2		" Indentation width for operations such as << or >>
set expandtab				" Converting hard tabs to soft tabs (spaces)
set autoindent
colorscheme wwdc16 	" Uses the wwdc colorscheme stored at ~/.vim/colors
										" https://github.com/lifepillar/vim-wwdc16-theme

syntax enable	 			" Syntax highlighting
set number 					" Enables line numbers
set relativenumber  " Line numbers relative to cursor (Real line number shown at cursor)

set cursorline			" Highlights current line
highlight cursorline guibg=#21232a
set showmatch       " When creating a new bracket pair, the cursor will flash the matching one
set wildmenu				" Enable autocomplete menu
set wildmode=list:longest " Complete longest common string, then list alternatives
set foldenable
set foldmethod=indent
let &colorcolumn=join(range(101,999),",") " Highlight the 100th & up character of the line
highlight ColorColumn guibg=#21232a

set incsearch       " Search as you type
set hlsearch        " Highlight all matches in the file
set ignorecase smartcase  " Searches are case-sensitive if they contain an upper-case letter
set ruler						" Enables ruler (status bar) at the bottom of the page
set laststatus=2    " Always show status bar
set visualbell			" Stops beeps for incorrect input

set modelines=0     " Prevents modeline security vulnerability
set encoding=utf-8  " The encoding displayed by vim
set fileencoding=utf-8  " The encoding written to file
set scrolloff=3     " Show x lines above the cursor when file is scrollable
set ttyfast         " Improves smoothness of redrawing (Fast terminal connection)
set backspace=indent,eol,start  " Makes backspace behave like you would expect
                    " indent: allows backspacing vim's autoindent
                    " eol: allows deletion of eol markers with backspace
                    " start: deletion of text inserted during the current insert session only
set undofile        " Persistent log of undos after opening/closing
set wrap            " Wrap lines longer than the window


" Remappings
" Don't include comments next to mappings
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

au FocusLost * :wa    " Save files when vim loses focus

" Testing Area
set showtabline=2   " Always show line with tab page labels

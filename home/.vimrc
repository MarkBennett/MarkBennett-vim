" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
"set tabstop=2                     " Global tab width.
"set shiftwidth=2                  " And again, related.
"set shifttabstop=2                " Number of spaces inserted when tab is hit
"set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
colorscheme vividchalk

" Tab mappings.
"map <leader>tt :tabnew<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>to :tabonly<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>
"map <leader>tf :tabfirst<cr>
"map <leader>tl :tablast<cr>
"map <leader>tm :tabmove

" NERDTree mappings
map <leader>n :NERDTreeToggle<cr>

" Taglist mappings
map <leader>T :TlistToggle<cr>
map <leader>trr :TlistAddFilesRecursive . *.rb<cr>
map <leader>trp :TlistAddFilesRecursive . *.py<cr>

" Preserve selection after indentation
vmap > >gv
vmap < <gv

" Map tab to indent in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Add custom filetypes
au BufNewFile,BufRead *.io set filetype=io
au BufNewFile,BufRead Vagrantfile,Guardfile set filetype=ruby
au BufNewFile,BufRead *.dart set filetype=dart

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby setlocal foldmethod=syntax tabstop=2 shiftwidth=2 expandtab foldlevel=4
autocmd FileType javascript setlocal foldmethod=syntax tabstop=2 shiftwidth=2 expandtab foldlevel=5 omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal foldmethod=syntax tabstop=2 shiftwidth=2 expandtab
autocmd FileType ant setlocal foldmethod=syntax tabstop=2 shiftwidth=2 expandtab
autocmd FileType io setlocal foldmethod=syntax tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType html setlocal foldmethod=syntax shiftwidth=2 tabstop=2 expandtab
autocmd FileType dart setlocal foldmethod=syntax shiftwidth=2 tabstop=2 expandtab

" Move my swap files out from beside the files themselves
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Highlight the 80th column to prevent long lines
if exists('+colorcolumn')
  set colorcolumn=80
else
  if exists('matchadd')
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
endif

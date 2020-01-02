set nocompatible  " Use Vim settings, rather then Vi settings
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set hidden
set number
set relativenumber
set numberwidth=5
set encoding=utf-8
set hlsearch
set undodir=~/.vim/undo

" ignore whitespaces when vimdiffing stuff
if &diff " diff mode
  set diffopt+=iwhite
endif
" Use one space, not two, after punctuation.
set nojoinspaces

" leader
let mapleader = " "

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Color scheme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Configure airline
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

filetype plugin indent on

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bar> :EasyAlign*<Bar><Enter>

if &term =~ "xterm" || &term =~ "screen"
 let g:CommandTCancelMap = ['<C-c>', '<ESC>']
 let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
 let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']
endif

" Show next matched string at the center of screeen
nnoremap n nzz
nnoremap N Nzz

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Switch between the last two files
nmap <leader><leader> <c-^>

nnoremap S :SplitLine<CR>

" Toggle zoom
nmap <leader>z <Plug>(zoom-toggle)

" Use Tab for autocompletion
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-P>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Strip trailing whitespaces and
" keep current cursor position
fun! <SID>StripTrailingWhitespaces()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" Use The Platinum Searcher
" https://github.com/monochromegane/the_platinum_searcher
if executable('pt')
  " Use Pt over Grep
  set grepprg=pt\ --nogroup\ --nocolor

  " Use pt in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'pt %s -l --nocolor --hidden -g ""'

  " pt is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraLines ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Set to auto read when a file is changed from the outside
set autoread
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType eruby,json,yaml,html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType ruby setlocal colorcolumn=79 shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType ruby,eruby,json,yaml,html autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType markdown setlocal spell spelllang=en_us,de_de

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" vim json settings
let g:vim_json_warnings = 1
let g:vim_json_syntax_conceal = 1

" Activate vim 7.4 matchit plugin
runtime macros/matchit.vim

" Settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Turn off annoying syntastic error in ERB files
let g:syntastic_eruby_ruby_quiet_messages =
  \ {'regex': 'possibly useless use of a variable in void context'}

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Rg<CR>

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Use incsearch.vim to highlight as I search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
" augroup END

"
" vim-markdown
"
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

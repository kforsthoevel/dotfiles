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
set formatprg=par\ -qw72

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

" Comments should be italic
highlight Comment cterm=italic

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

" Clear search highlight
nnoremap <CR> :nohlsearch<CR><CR>

" Toggle zoom
nmap <leader>z <Plug>(zoom-toggle)

" Use Tab for autocompletion
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-P>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

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
autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix foldmethod=indent
autocmd FileType py  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
au BufNewFile,BufRead *.yaml.gotmpl,*.yml.gotmpl setf yaml

" Fugitive stuff
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

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

" Golang autoimport on save
let g:go_fmt_command = "goimports"

" Terraform autofmt on save
let g:terraform_fmt_on_save=1

" vim-markdown
"
" Disable folding
let g:vim_markdown_folding_disabled = 1

" COC stuff start
" Disabling vim-go mapping `gd` for go to definition
let g:go_def_mapping_enabled = 0

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don’t pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" COC stuff end

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

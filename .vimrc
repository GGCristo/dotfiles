"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    _____  .__        .__
"   /     \ |__| ___  _|__| ____________   ____
"  /  \ /  \|  | \  \/ /  |/     \_  __ \_/ ___\
" /    Y    \  |  \   /|  |  Y Y  \  | \/\  \___
" \____|____/__|   \_/ |__|__|_|__/__|    \_____>
"   ________  _________________        .__          __
"  /  _____/ /  _____/\_   ___ \_______|__| _______/  |_  ____
" /   \  ___/   \  ___/    \  \/\_  __ \  |/  ___/\   __\/  _ \
" \    \_\  \    \_\  \     \____|  | \/  |\___ \  |  | (  <_> )
"  \________/\________/\________/|__|  |__/______> |__|  \____/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic
highlight Normal ctermbg=NONE
set nocompatible
set noswapfile
set nobackup
set autoindent
set complete=.,w,b,u,t,i,kspell
set background=dark
filetype plugin indent on
syntax on
set encoding=utf-8
set mouse=a
set number
" I dont want autocomments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set relativenumber
set clipboard^=unnamedplus
set hidden
set cc=81
set autoread
set splitright
"au CursorHold * checktime
autocmd FileType gitcommit setlocal spell
set path+=**
set wildmenu
set backspace=indent,eol,start
set incsearch
set list listchars=tab:⍿·,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set showbreak=↪\
set switchbuf+=usetab,newtab
set spelllang=es,en_us
if has ('nvim')
  set guifont=FiraCode\ Nerd\ Font\ Mono\
endif
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
set laststatus=2
" Persist undo history between file editing sessions.
set undofile
set undolevels=5000
set undodir=~/.vim/undodir

set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

filetype plugin on

":h modifyOtherKeys
let &t_TI = ""
let &t_TE = ""
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" More range selectors
" https://www.reddit.com/r/vim/comments/i8prmn/vifm_as_a_nerdtree_alternative_my_in_progress/
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '-', '#' ]
  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
  execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
  execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
  execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'GGCristo/Crear'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'dense-analysis/ale'
  Plug 'skywind3000/asynctasks.vim'
  Plug 'skywind3000/asyncrun.vim'

  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-apathy'
  Plug 'rbong/vim-crystalline'
  if !has('nvim')
    Plug 'rhysd/vim-healthcheck'
  endif
  Plug 'mhinz/vim-startify'
  Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c'}
  Plug 'airblade/vim-gitgutter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree', {'on': 'NERDTreeFind'}
  Plug 'junegunn/vim-easy-align'
  Plug 'simnalamburt/vim-mundo'
  Plug 'haya14busa/incsearch.vim'
  Plug 'Valloric/ListToggle'
  Plug 'easymotion/vim-easymotion'
  Plug 'tweekmonster/startuptime.vim'
  Plug 'ericcurtin/CurtineIncSw.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'Yggdroot/indentLine'
  Plug 'unblevable/quick-scope'
  Plug 'markonm/traces.vim'
  Plug 'tpope/vim-commentary'
  Plug 'cdelledonne/vim-cmake'
  Plug 'metakirby5/codi.vim'
  Plug 'psliwka/vim-smoothie'
  Plug 'machakann/vim-highlightedyank'
  Plug 'gruvbox-community/gruvbox'
call plug#end()

" Abbrevation
iabbrev Vector vector

"VISUALS
augroup my_colours
  autocmd!
  autocmd ColorScheme hi SpellBad cterm=reverse
augroup END
" Force to use underline for spell check results
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
augroup END

set t_Co=256
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0
set termguicolors
colorscheme gruvbox

set tags=./tags;/ "This will look in the current directory for "tags", and work up the tree towards root until one is found.
                  "IOW, you can be anywhere in your source tree instead of just the root of it.

" MAPPING && FUNCTIONS

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  execute a:command
  " Clean up: restore previous search history, and cursor position
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
"
" Puedo usar regex para rellenar args
" https://stackoverflow.com/questions/9033239/vim-regex-or-in-file-name-pattern-on-windows:w
function! ArgsPattern(pat)
  let file_list = filter(split(globpath('.','**'),nr2char(10)), 'v:val =~ ''' . substitute(a:pat,"'","''",'g') . '''')
  execute 'args ' . join(map(file_list,'fnameescape(v:val)'),' ')
endfunction
command! -nargs=+ ArgsPattern call ArgsPattern(<q-args>)

function! SaveSession()
  cd %:h
  let dir = finddir('src/..',';')
  execute 'cd' fnameescape(dir)
  let root_project = fnamemodify(dir, ':t')
  execute ':Obsession ~/.vim/session/' . expand(root_project)
endfunction

let mapleader= " "
" F5 para empezar para debugear/continuar
" S-F5 para parar de debugear
" C-S-F5 para restaurar el debuger con la misma configuración
" F6 Para pausar el debugger
  "nnoremap <silent><F6> :Termdebug %:r<CR><c-w>2j<c-w>L
" F9
" S-F9
"F10 Step Over
"F11 Step Into
"S-F11 Step out of current function scope
let g:lt_quickfix_list_toggle_map = '<F3>'

let modo = 1
nnoremap <expr>cb ((modo) ? ':AsyncTask project-build' : ':echo "Hola"')."\<cr>"
map <expr>cr ((modo) ? ':!clear' ."\<cr>". ':AsyncTask project-run' : ':echo "Hola"')."\<cr>"
nnoremap <silent><S-F4> :AsyncTask project-clean<cr>:echo "🌬 Se usó clean 🌬"<cr>
nnoremap <expr><silent><leader>cs ((modo) ? ':let modo=0' : ':let modo=1')."\<cr>"

autocmd FileType javascript nnoremap <silent><F4> :!clear<cr>:!node %<cr>

nnoremap <silent><F7> :MundoToggle<CR>

if executable("cppcheck")
  nnoremap <silent><F8> :!clear<cr>:!cppcheck --enable=all --suppress=missingIncludeSystem . -itest/ -ibuild/ -iDebug/ -i.ccls-cache/<CR>
else
  nnoremap <silent><F8> :echo "Instala cppcheck"<CR>
endif

nnoremap <silent><F12> :call MyNerdToggle()<cr>

map <silent><leader><leader> :call CurtineIncSw()<cr>
nnoremap <silent><leader>bk :call vimspector#ToggleBreakpoint()<cr>
nnoremap ,,  mtA;<Esc>`t
nnoremap <silent><C-S> :update<cr>:echo 'Buffer actual guardado🖪'<cr>
inoremap <silent><C-S> <esc>:update<cr>:echo 'Buffer actual guardado'<cr>
nnoremap <silent><C-Q> :wa<cr>:echo 'Todos los buffer guardados'<cr>
inoremap <silent><C-Q> <esc>:wa<cr>:echo 'Todos los buffer guardados'<cr>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <expr> <C-P> (len(system('git rev-parse')) ? ':Files' : ':GFiles --cached --others --exclude-standard')."\<cr>"
if executable ("rg")
  nnoremap <silent><C-N> :Rg<CR>
  set grepprg=rg\ --vimgrep\ --hidden\
else
  nnoremap <silent><C-N> :Lines<CR>
endif
nnoremap <silent><leader>s :BTags<cr>
nnoremap <silent><leader>gw :Gwrite<cr>
nnoremap <silent><leader>gc :Commits<cr>
nnoremap <silent><leader>gr :Gread<CR>
nnoremap <silent><leader>gs :G<CR>
nnoremap <silent><leader>gp :Git push origin HEAD<CR>
nnoremap <silent><leader>gh :!hub browse<CR>
map <silent><Leader>gb :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

imap jk <Esc>
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>
vnoremap <silent><Up> :m '<-2<CR>gv=gv
vnoremap <silent><Down> :m '>+1<CR>gv=gv

nnoremap <silent> <tab> :call Tab()<cr>
nnoremap <silent> <S-tab> :call STab()<cr>

inoremap {;<CR> {<CR>};<ESC>O

function! Tab()
  if &ft == "qf"
    execute "cnewer"
  elseif tabpagenr('$') > 1
    execute "tabnext"
  else
    execute "bn"
  endif
endfunction

function! STab()
  if &ft == "qf"
    execute "colder"
  elseif tabpagenr('$') > 1
    execute "tabprevious"
  else
    execute "bp"
  endif
endfunction

"autocmd BufLeave * cclose
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
map <silent><leader>r :source $MYVIMRC<CR>
map <silent><leader>bd :call Preserve("%bd<bar>e#<bar>bd#")<CR>
nnoremap <leader>x *``cgn
nnoremap <leader>X #``cgn
map Y y$
nnoremap n nzz
nnoremap N nzz
nnoremap <silent><leader>v :vsp $MYVIMRC<CR> <C-W>H
" Easy paste above/below
nnoremap <silent><leader>p :put<CR>
nnoremap <silent><leader><S-p> :put!<CR>

" Easy new lines
nnoremap <silent> [<space> :call append(line('.')-1, '')<CR>
nnoremap <silent> ]<space> :call append(line('.'), '')<CR>

"auto close {
"(https://www.reddit.com/r/vim/comments/6h0dy7/which_autoclosing_plugin_do_you_use/)
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()
" Spelling
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" ALE
let g:ale_fixers = {'cpp': ['remove_trailing_lines', 'trim_whitespace'], '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_linters = {'cpp': ['g++','clangd','ccls'], 'javascript' : ['eslint']}
" let g:ale_cpp_cppcheck_options = '--enable=all --suppress=missingIncludeSystem'
let g:ale_cpp_clangtidy_checks = [
      \'-clang-analyzer-*',
      \'performance-*',
      \'readability-*','-readability-implicit-bool-conversion',
      \ '-readability-magic-numbers',
      \'modernize-*','-modernize-use-trailing-return-type',
      \'bugprone-*']
let g:ale_open_list = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = ''

let g:ale_pattern_options = {
      \   'test.cpp': {'ale_enabled': 0},
      \}

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline
highlight ALEErrorLine ctermbg=none cterm=None
highlight ALEWarningLine ctermbg=none cterm=None
" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
"let g:ale_pattern_options_enabled = 1
"let g:ale_set_balloons=1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:alex_disable_lsp = 1

let g:ale_lint_delay = 1000
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
" " TextEdit might fail if hidden is not set.

" COC

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
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

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <NUL> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText ctermfg=black ctermbg=72 guifg=black guibg=#689d6a
hi CoCHoverRange ctermfg=black ctermbg=72 guifg=black guibg=#689d6a

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
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" FZF
set rtp+=~/.fzf
let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'enter': 'drop',
      \ 'ctrl-t': 'tab drop',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'}
let g:fzf_preview_window = 'right:60%'
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rg
      \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%'), <bang>0)

""TAGBAR
let g:tagbar_autoclose=1

"Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
packadd! vimspector

"Gitgutter
if (executable("rg"))
  let g:gitgutter_grep = 'rg'
endif
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_priority = 8
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'
highlight GitGutterAdd    ctermfg=40
highlight GitGutterChange ctermfg=93
highlight GitGutterDelete ctermfg=1
hi clear SignColumn
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
""highlight GitGutterAdd    guifg=green guibg=green ctermfg=green ctermbg=green
""highlight GitGutterChange guifg=yellow guibg=yellow ctermfg=yellow ctermbg=yellow
""highlight GitGutterDelete guifg=red guibg=red ctermfg=red ctermbg=red

"STARTIFY
let g:startify_session_dir = '~/.vim/session'
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
      \'  ##############..... ##############  ',
      \'  ##############......##############  ',
      \'    ##########..........##########    ',
      \'    ##########........##########      ',
      \'    ##########.......##########       ',
      \'    ##########.....##########..       ',
      \'    ##########....##########.....     ',
      \'  ..##########..##########.........   ',
      \'....##########.#########............. ',
      \'  ..################JJJ............   ',
      \'    ################.............     ',
      \'    ##############.JJJ.JJJJJJJJJJ     ',
      \'    ############...JJ...JJ..JJ  JJ    ',
      \'    ##########....JJ...JJ..JJ  JJ     ',
      \'    ########......JJJ..JJJ JJJ JJJ    ',
      \'    ######    .........               ',
      \'                .....                 ',
      \'                  .      ',
      \])

let g:startify_fortune_use_unicode = 1

hi StartifyFooter        guifg=NONE guibg=NONE gui=NONE
let g:startify_custom_footer = startify#fortune#boxed()
      "\ startify#pad(split(system('fortune | cowsay -f tux'), '\n'))

"NERDTREE
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
function MyNerdToggle()
  if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction

" INCSEARCH
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)zz
map #  <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)zz
map g# <Plug>(incsearch-nohl-g#)zz


"" EASYMOTION
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

"" Vim-Easy-Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
      \ '>': { 'pattern': '>>\|=>\|>' },
      \ '<': { 'pattern': '<<\|<' },
      \ '/': {
      \     'pattern':         '//\+\|/\*\|\*/',
      \     'delimiter_align': 'l',
      \     'ignore_groups':   ['!Comment'] },
      \ ']': {
      \     'pattern':       '[[\]]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   },
      \ ')': {
      \     'pattern':       '[()]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   }
      \ }

"" vim-lsp-cxx-highlight
hi LspCxxHlSymVariable ctermfg=Grey guifg=#a0a8b0 cterm=none gui=none
hi LspCxxHlSymParameter ctermfg=Grey guifg=#a0a8b0 cterm=none gui=none
hi LspCxxHlGroupMemberVariable ctermfg=Magenta guifg=#bd93f9

""vim-crystalline

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()} '
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{cmake#statusline#GetCmdInfo()}'
  endif

  let l:s .= '%='

  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{modo ?"build":"Debug"}'
    let l:s .= crystalline#left_sep('', '') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

if filereadable(expand('~/.vim/plugged/vim-devicons/plugin/webdevicons.vim'))

  function! TabLabel(buf, max_width) abort
    let [l:left, l:name, l:short_name, l:right] = crystalline#default_tablabel_parts(a:buf, a:max_width)
    return l:left . l:short_name . ' ' . WebDevIconsGetFileTypeSymbol(l:name) . (l:right ==# ' ' ? '' : ' ') . l:right
  endfunction

  function! TabLine() abort
    return crystalline#bufferline(0, 0, 1, 1, 'TabLabel', crystalline#default_tabwidth() + 3)
  endfunction

else

  function! TabLine()
    let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
    return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
  endfunction

endif

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'badwolf'

set showtabline=2
set guioptions-=e
set laststatus=2

"" indentLine
let g:indentLine_fileTypeExclude = ['help', 'startify']

"" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg=#afff5f gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg=#5fffff gui=underline ctermfg=81 cterm=underline

""vim-commentary
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" highlightedyank
let g:highlightedyank_highlight_duration = 500
"asyncrun
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['src']
let g:asynctasks_term_pos = 'external'
let g:asynctasks_term_pos = 'tab'

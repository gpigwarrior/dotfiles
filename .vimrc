
set nocompatible 
set mouse=a
set viminfo=%,<200,'10,/50,:100
" %buffer list, <lines in each register, 'marks, /searches, :commands

set linebreak

set cinoptions=:0,g0,(0,W4,m1
" set clipboard=unnamedplus

packadd termdebug

" Plugins! 
call plug#begin('~/.vim/plugged') 
"List your plugins here 
"tpope 
Plug 'tpope/vim-commentary' 
Plug 'tpope/vim-sensible' 

"colorschemes 
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim' 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nanotech/jellybeans.vim'
Plug 'sjl/badwolf'
Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim'

" syntax highlighting
Plug 'sheerun/vim-polyglot'
" Matlab
"Plug ' jmarkow /vim-matlab' 
Plug 'vim-scripts/MatlabFilesEdition'
"Plug 'lazywei/vim-matlab'
"Plug 'ibbo/mlint.vim'


"ide type stuff
" Plug 'neoclide/coc.nvim', {'branch': 'release'} | " autocomplete
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}lug 'dense-analysis/ale' | " linter 
Plug 'puremourning/vimspector' | " IDE/debugger 

" other 
Plug 'termhn/i3-vim-nav'  | "i3 and vim splits  
Plug 'vifm/vifm.vim' | " vifm interface 
call plug#end()



"fulction s:hl(group, attrs)
"    let l:command = "highlight" . " " . a:group
"    for name in keys(a:attrs)
"        let l:command .= " " . name . "=" . a:attrs[name]
"    endfor
"    execute l:command
"endfunction

" theme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >

  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_material_foreground='original'
        " For dark version.
        set background=dark

        " Set contrast.
        let g:gruvbox_material_background = 'medium'
" let jellybeans use italics
let g:jellybeans_use_term_italics = 1

colorscheme gruvbox-material


" extra colors for the colorscheme 
":hi Comment guifg=#998e85	| "comments
":hi Normal guibg=#1b1b1b	| "background
" :hi LineNr guifg=#565668	| "line numbers
":hi LineNr guifg=#555555	| "line numbers
" :hi Search guibg=#2f9147	| " searchehighlighting 
" :hi Search guibg=#8e95bf	| " search highlighting 

 " au filetype * hi Search guibg=#3e3e3e Search guifg=NONE Search ctermbg=NONE Search cterm=NONE

" au filetype * hi Search guibg=#3e3e3e 
" au filetype * hi Search guifg=NONE 
" au filetype * hi Search ctermbg=NONE 
" au filetype * hi Search cterm=NONE

" let g:netrw_banner = 0 | let g:netrw_liststyle = 3| let g:netrw_browse_split = 4| let g:netrw_altv = 1| let g:netrw_winsize = 25| nmap <silent> <C-e> :Lexplore<CR>


au filetype * hi Search guibg=#3e3e3e guifg=NONE ctermbg=NONE cterm=NONE
"extra stuff for tokyonight vim
"set termguicolors
"
"let g:tokyonight_style = 'storm' " available: night, storm
"let g:tokyonight_enable_italic = 1
"
"uolorscheme tokyonight
"set background =dark
au filetype * hi Search guibg=#3e3e3e guifg=NONE ctermbg=NONE cterm=NONE
"extra stuff for tokyonight vim
"set termguicolors
"
"let g:tokyonight_style = 'storm' " available: night, storm
"let g:tokyonight_enable_italic = 1
"
"uolorscheme tokyonight
"set background =dark



" stuff dracula said to add
"if v:version < 802
"    packadd! dracula
"endif
"syntax enable
"colorscheme dracula


" Remap o and O to not put into insert mode 
nnoremap o o<Esc>
nnoremap O O<Esc>


syntax on 
" autoindent
filetype plugin indent on
set autoindent
" au filetype python setl shiftwidth=4 tabstop=4

" set jk to esc in insert and visual mode  
inoremap jk <esc>
vnoremap jkv <esc>

" autosave 
:set autoread
au FocusLost,WinLeave * :silent! w"
au FocusGained,BufEnter * if &buftype == 'normal' | checktime | endif

" disable swapfiles
:set noswapfile
" put backups in same folder 
set backupdir=~/vimtmp//,.

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_ER = "\e[6 q"
let &t_EI = "\e[2 q"



" prevent autocoment when pressing o

autocmd FileType * set formatoptions-=r
autocmd FileType * set formatoptions-=o


autocmd FileType matlab set commentstring=%%s




"start off with line #s
set nu
set rnu 

" see commands as I type
set showcmd

" from irrigger/ir-vim
set scrolloff=3
set noerrorbells 
set title 
set incsearch 
set hlsearch 
set viminfo='1000,h
set hidden
set undofile 
" set backspace=indent,eol,start 
set wildmenu 

" wildmenu more comfortable
set wildmode=longest:list,full

" case insensative search
set ignorecase
set smartcase


" i3 amd vim splits 
" nnoremap <silent> <C-l> :call Focus('right', 'l')<CR>
" nnoremap <silent> <C-h> :call Focus('left', 'h')<CR>
" nnoremap <silent> <C-k> :call Focus('up', 'k')<CR>
" nnoremap <silent> <C-j> :call Focus('down', 'j')<CR>

" vimspector 
let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector

"    " let pid = 12345 
"    call vimspector#LaunchWithConfigurations({
"                \  "attach": {
"                \    "adapter": "vscode-bash-debug",
"                \    "configuration": {
"                \      "request": "launch",
"                \      "processId": 123499 
"                \    }
"                \  }
"               \})


" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion source for other completion plugins, like Deoplete.  let g:ale_completion_enabled = 1
" autocmd FileType matlab :set commentsting=%%s


" smooth scrolling
nnoremap <silent> <c-u> :call <sid>smoothScroll(1)<cr>
nnoremap <silent> <c-d> :call <sid>smoothScroll(0)<cr>

fun! s:smoothScroll(up)
  execute "normal " . (a:up ? "\<c-y>" : "\<c-e>")
  redraw
  for l:count in range(3, &scroll, 2)
    sleep 7m
    execute "normal " . (a:up ? "\<c-y>" : "\<c-e>")
    redraw
  endfor
  " bring the cursor in the middle of screen 
  execute "normal M"
endf



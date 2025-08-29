

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
Plug 'neoclide/coc.nvim', {'branch': 'release'} | " autocomplete
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}lug 'dense-analysis/ale' | " linter 
Plug 'puremourning/vimspector' | " IDE/debugger 

" other 
Plug 'termhn/i3-vim-nav'  | "i3 and vim splits  
Plug 'vifm/vifm.vim' | " vifm interface 
call plug#end()

colorscheme gruvbox


set rnu 
set nu

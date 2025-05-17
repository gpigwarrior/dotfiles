:set rnu

" Plugins!
call plug#begin('~/.vim/plugged')

" List your plugins here
" colorschemes 
Plug 'tpope/vim-sensible'
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
" Matlab
Plug ' jmarkow /vim-matlab' 
Plug 'vim-scripts/MatlabFilesEdition'
" Plug 'daeyun/vim-matlab'
Plug 'MIBismuth/matlab.nvim'
" other 
"Plug 'puremourning/vimspector' | " IDE/debugger 
call plug#end()


    config = function()
        require('matlab').setup({
            matlab_dir = "$m"
        })


colorscheme gruvbox

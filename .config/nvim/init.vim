call plug#begin()
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Domeee/mosel.nvim'
Plug 'sainnhe/gruvbox-material'

Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'

Plug 'numToStr/Comment.nvim'
Plug 'easymotion/vim-easymotion'

" Plug 'Valloric/MatchTagAlways'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mattn/emmet-vim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'https://github.com/tpope/vim-fugitive.git'

Plug 'stevearc/vim-arduino'

Plug 's1n7ax/nvim-terminal'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

set termguicolors
colorscheme gruvbox-material

lua << EOF
vim.o.hidden = true
require("bufferline").setup{
	options={
		right_mouse_command = "vertical sbuffer %d",
	}
}
require('Comment').setup()
require('gitsigns').setup()
require('telescope').load_extension('media_files')


require('nvim-terminal').setup({
    window = {
        -- Do `:h :botright` for more information
        -- NOTE: width or height may not be applied in some "pos"
        position = 'botright',

        -- Do `:h split` for more information
        split = 'sp',

        -- Width of the terminal
        width = 50,

        -- Height of the terminal
        height = 15,
    },

    -- keymap to disable all the default keymaps
    disable_default_keymaps = false,

    -- keymap to toggle open and close terminal window
    toggle_keymap = '<leader>;',

    -- increase the window height by when you hit the keymap
    window_height_change_amount = 2,

    -- increase the window width by when you hit the keymap
    window_width_change_amount = 2,

    -- keymap to increase the window width
    increase_width_keymap = '<leader><leader>+',

    -- keymap to decrease the window width
    decrease_width_keymap = '<leader><leader>-',

    -- keymap to increase the window height
    increase_height_keymap = '<leader>+',

    -- keymap to decrease the window height
    decrease_height_keymap = '<leader>-',

    terminals = {
        -- keymaps to open nth terminal
        {keymap = '<leader><leader>1'},
        {keymap = '<leader><leader>2'},
        {keymap = '<leader><leader>3'},
        {keymap = '<leader><leader>4'},
        {keymap = '<leader><leader>5'},
    },
})
EOF

" TREESITTER CONFIG 
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"cpp"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

syntax on
set number
set softtabstop=2 
set tabstop=2 
set expandtab
set shiftwidth=2
set relativenumber
set mouse=a

let g:coc_global_extensions = [
		\'coc-clangd',
		\'coc-spell-checker',
		\'coc-cmake',
		\'coc-pairs',
		\'coc-snippets',
		\'coc-emmet',
		\'coc-css',
		\'coc-html',
		\'coc-json',
		\'coc-prettier',
		\'coc-tsserver',
		\'coc-lua',
		\'coc-pyright'
		\]

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <leader>s <cmd>CocCommand clangd.switchSourceHeader<CR>

" Format selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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


" #### NVIM TREE ####

lua <<EOF

require'nvim-tree'.setup {
	open_on_setup = true,
}

EOF
let g:nvim_tree_auto_open = 1
let g:nvim_tree_quit_on_open = 0

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <leader>t :NvimTreeToggle<CR>


noremap <leader>y "+y

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Map capslock to escape
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

nnoremap <silent>[> :BufferLineCycleNext<CR>
nnoremap <silent>[< :BufferLineCyclePrev<CR>

" Go to tab by number
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" vim-arduino keybinds
nnoremap <buffer> <leader>aa <cmd>ArduinoAttach<CR>
nnoremap <buffer> <leader>am <cmd>ArduinoVerify<CR>
nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
nnoremap <buffer> <leader>ad <cmd>ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab <cmd>ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap <cmd>ArduinoChooseProgrammer<CR>

let g:closetag_filenames = '*js, *.html,*.xhtml,*.phtml'

" let g:closetag_regions = {
"     \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"     \ 'javascript.jsx': 'jsxRegion',
"     \ 'typescriptreact': 'jsxRegion,tsxRegion',
"     \ 'javascriptreact': 'jsxRegion',
"     \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


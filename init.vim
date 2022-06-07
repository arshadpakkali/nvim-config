:let mapleader = " "
set nocompatible

lua require('plugins') 
lua require('whichkey')

"---------Configs 

set relativenumber
set smartindent 
set incsearch
set nobackup
set noswapfile 
set undodir=~/.config/nvim/undoDir
set undofile
set smartcase
set laststatus=2
set nu
set encoding=UTF-8
set wildmenu
set colorcolumn =80
set expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set signcolumn=yes
set scrolloff=5

""---COLORSCHEME
let g:airline_powerline_fonts = 1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
set termguicolors     " enable true colors support

colorscheme gruvbox 
set background=dark 
set lazyredraw

"-- FOLDING --  
set foldmethod=syntax "syntax highlighting items specify folds  
" set foldcolumn=1 "defines 1 col at window left, to indicate folding  
let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened


let g:indentLine_char = '┊'

" fix cursor hold plugin config
let g:cursorhold_updatetime = 100

" open Coc-Explorer with ctrl + n
nmap <C-n> :CocCommand explorer<CR>

" ---- Coc completion
source ~/.config/nvim/coc.vim

source ~/.config/nvim/keymaps.vim

autocmd FileType scss setl iskeyword+=@-@

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix

" :let maplocalleader = "."

inoremap jj <Esc>
tnoremap jj <c-\><c-n>


" copy/yank to clip board
set clipboard=unnamedplus
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Terminal open 
" hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guifg=cyan
let g:floaterm_height=0.9
let g:floaterm_width=0.9

" open files on normal window
function s:open_in_normal_window() abort
  let f = findfile(expand('<cfile>'))
  if !empty(f) && has_key(nvim_win_get_config(win_getid()), 'anchor')
    FloatermHide
    execute 'e ' . f
  endif
endfunction

autocmd FileType floaterm nnoremap <silent><buffer> gf :call <SID>open_in_normal_window()<CR>
autocmd FileType floaterm nnoremap <silent><buffer> gF :call <SID>open_in_normal_window()<CR>

nnoremap <leader>tt :FloatermToggle<CR>
tnoremap <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <leader>tn <C-\><C-n>:FloatermNew<CR>
tnoremap <leader>tk <C-\><C-n>:FloatermNext<CR>
tnoremap <leader>tj <C-\><C-n>:FloatermPrev<CR>



nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <leader>w <C-w>

nnoremap <S-w> :wa<CR>


noremap <leader>f :Format<CR>
nnoremap <leader>u :UndotreeToggle<CR>


nnoremap <leader>cl :Vista!!<CR>
nnoremap <leader>cL :Vista coc<CR>

nmap <leader>tc :ColorHighlight<CR>


" vimspector mappings
" let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dq :call vimspector#Reset()<CR>
nmap <leader>dr :call vimspector#Restart()<CR>
nmap <leader>dc :call vimspector#Continue()<CR>

nmap <leader>dj :call vimspector#StepOut()<CR>
nmap <leader>dk :call vimspector#StepInto()<CR>
nmap <leader>dl :call vimspector#StepOver()<CR>

nmap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>d. :call vimspector#RunToCursor()<CR>
nmap <leader>dx :call vimspector#ClearBreakpoints()<CR>
nmap <leader>d? :call AddToWatch()<CR>
nmap <leader>di <Plug>VimspectorBalloonEval
xmap <leader>di <Plug>VimspectorBalloonEval

func! AddToWatch()
  let word = expand("<cexpr>")
  call vimspector#AddWatch(word)
endfunction
let g:vimspector_base_dir=expand('$HOME/.config/vimspector-config')


"   --- coc-git keymaps
" navigate chunks of current buffer
nmap <leader>gk <Plug>(coc-git-prevchunk)
nmap <leader>gj <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap <leader>g[ <Plug>(coc-git-prevconflict)
nmap <leader>g] <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap <leader>gi <Plug>(coc-git-chunkinfo)
nmap <leader>gu :CocCommand git.chunkUndo<CR>
nmap <leader>gs :CocCommand git.chunkStage<CR>

" show commit contains current position
nmap <leader>gci <Plug>(coc-git-commit)



" javascript snippetsgcc
inoremap clg console.log();<Esc>==f(a





function! s:ToggleBlame()
    if &l:filetype ==# 'fugitiveblame'
        close
    else
        G blame
    endif
endfunction


function! s:ToggleFugitive()
    if &l:filetype ==# 'fugitive'
        close
    else
        G
    endif
endfunction


noremap <leader>gb :call <SID>ToggleBlame()<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nnoremap <leader>gg :call<SID>ToggleFugitive()<CR>


lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})
EOF

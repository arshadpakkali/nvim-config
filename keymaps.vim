" FZF Mappings
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


noremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."<Cr>"
noremap <leader>sp :Rg<Cr>
noremap <leader>b :Buffers<Cr>

noremap <leader>rr :so ~/.config/nvim/init.vim<Cr>
"
"
"

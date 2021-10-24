vim.cmd([[
nnoremap <Space> <Nop>
let mapleader = " "

nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>q :bp\|bd #<cr>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])

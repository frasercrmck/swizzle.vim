" swizzle.vim - swizzle characters under the cursor
" Author:  Fraser Cormack <frasercrmck@gmail.com>
" Version: 1.0
" License: This file is placed in the public domain.
" Source repository: https://github.com/frasercrmck/swizzle.vim

" Initialization {{{
if exists("g:loaded_swizzle") || &cp
  finish
endif
let g:loaded_swizzle = 1
" }}}

" Maps {{{
nnoremap <silent> <Plug>SwizzleChar :<C-U>call swizzle#Swizzle(v:count)<CR>
                                    \:silent! call repeat#set("\<Plug>SwizzleChar", v:count)<CR>

if !exists("g:swizzle_no_mappings") || !g:swizzle_no_mappings
  nnoremap gs <Plug>SwizzleChar
endif
" }}}

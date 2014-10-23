" swizzle.vim - swizzle characters under the cursor
" Author:  Fraser Cormack <frasercrmck@gmail.com>
" Version: 1.0
" License: This file is placed in the public domain.
" Source repository: https://github.com/frasercrmck/swizzle.vim

" Initialization {{{
if !exists("g:loaded_swizzle") || &cp
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
" }}}

" Global Variables {{{
if !exists("g:swizzle_sequences")
  let g:swizzle_sequences = [ ['x', 'y', 'z', 'w'], ['r', 'g', 'b', 'a'] ]
endif
" }}}

" Functions {{{
" Swizzles the character under the cursor
function! swizzle#Swizzle(argCount)
  " Get the character under the cursor
  let currentChar = getline(".")[col(".")-1]

  let charFound = 0
  let startIndex = 0
  let swizzleSequence = []
  " Loop over the defined swizzle sequences and get the relevant sequence for the
  " character in question
  for l in g:swizzle_sequences
    if charFound
      break
    endif

    let i = 0
    for c in l
      if currentChar == c
        let charFound = 1
        let swizzleSequence = l
        let startIndex = i
        break
      endif
      let i += 1
    endfor
  endfor

  " Exit if no char was found
  if !charFound
    return
  endif

  " Always swizzle at least one coord
  let replaceCount = a:argCount == 0 ? 1 : a:argCount

  " Calculate the index of the character we want to replace the current one
  " with
  let replaceIndex = (startIndex + replaceCount) % len(swizzleSequence)

  " Grab this character from the swizzle sequence
  let newChar = swizzleSequence[replaceIndex]

  " Convert to uppercase if character under cursor is upper case
  if currentChar ==# toupper(currentChar)
    let newChar = toupper(newChar)
  endif

  " Finally, replace the character
  :exec ":normal! r".newChar
endfunction
" }}}

let &cpo = s:cpo_save
unlet s:cpo_save

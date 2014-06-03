# swizzle.vim

Replaces the character under the cursor through a sequence of swizzles.
Use `gs` (which can take a count) to swizzle the character under the cursor.
For example, with a swizzle sequence of ['x', 'y', 'z', 'w'], using `gs` on
'x' will replace it with 'y', then `gs` again will replace that with 'z', etc.
Using `2gs` will skip past 'w' and loop back to 'x'.

The real power comes from using this plugin with [repeat.vim](https://github.com/tpope/vim-repeat),
as you can then use `.` to re-swizzle characters.

## Installation

If you use [Vundle](https://github.com/gmarik/Vundle.vim), add these lines to your `.vimrc`:
    Bundle 'frasercrmck/swizzle.vim'
Then type the following in vim:
    :BundleInstall

If you use [pathogen](https://github.com/tpope/vim-pathogen), then issue the following commands:
    cd ~/.vim/bundle && git clone git://github.com/frasercrmck/swizzle.vim.git
Don't forget to update the help with:
    :helptags


## Customisation

You can remove or override the default mapping with:
    let g:swizzle_no_mappings = 1
    nmap YourMap <Plug>SwizzleChar
in your `.vimrc`.

You can also override the default swizzle sequences with:
    let g:swizzle_sequences = [ ['a', 'b', 'c'] ]
in your `.vimrc`.

Note: please read the help by typing `:help swizzle` in vim for more information.

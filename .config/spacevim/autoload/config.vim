function! config#apply() abort
  let g:yaifa_expandtab=0
  let &cc = g:spacevim_max_column

  set ignorecase
  set wrap

  set scrolloff=5
  set whichwrap+=<,>,[,]
  set completeopt+=noselect
endfunction

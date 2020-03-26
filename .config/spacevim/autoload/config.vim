function! config#apply() abort
  let g:yaifa_expandtab=0
  let &cc = g:spacevim_max_column

  call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

  set ignorecase
  set wrap

  set scrolloff=5
  set whichwrap+=<,>,[,]
endfunction

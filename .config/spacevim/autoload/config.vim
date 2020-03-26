function! config#apply() abort
  if hostname() == 'desktop'
    let g:neodark#background='#31363b'
  endif

  if hostname() == 'surfacebook'
    let g:neodark#background='#353535'
  endif

  let g:yaifa_expandtab=0
  let &cc = g:spacevim_max_column

  call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

  set ignorecase
  set wrap

  set scrolloff=5
  set whichwrap+=<,>,[,]
endfunction

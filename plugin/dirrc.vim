" dirrc.vim
" Author: ... <numerical@gmail.com>

if exists("g:loaded_dirrc") || &cp
  finish
endif
let g:loaded_dirrc = 1
let s:keepcpo = &cpo
set cpo&vim

augroup dirrc_group
  autocmd BufNewFile,BufRead *       call s:LoadConfs(@%)
augroup END

function s:LoadConfs(name)
  let dir = expand("%:p:h")
  if(dir =~ "^" . $HOME) " get all vimrcs until home directory and execute them from farthest from file to closest
    let dirs = []
    while(dir != $HOME)
      call add(dirs, dir)
      let dir = dir[0:strridx(dir, '/')-1] " chop off a directory
    endwhile
    let dirs = reverse(dirs)
    for d in dirs
      if(filereadable(d . '/.vimrc'))
        exec "so" d . '/.vimrc'
      endif
    endfor
  elseif(filereadable(dir.'/.vimrc')) " if not in $HOME and if exists vimrc in this directory get it
    exec "so" dir . '/.vimrc'
  endif
endfunction


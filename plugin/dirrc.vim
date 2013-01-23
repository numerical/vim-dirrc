" dirrc.vim
" Author: ... <numerical@gmail.com>

if exists("g:loaded_dirrc") || &cp
  finish
endif
let g:loaded_dirrc = 1

if(!exists("g:dirrc_security"))
  let g:dirrc_security = 1
endif

if(!exists("g:dirrc_resource_name"))
  let g:dirrc_resource_name = '.vimrc'
endif

let s:keepcpo = &cpo
set cpo&vim

augroup dirrc_group
  autocmd BufNewFile,BufRead *       call s:LoadConfs()
augroup END

function s:LoadConfs()
  let dir = expand("%:p:h")
  if(dir =~ "^" . $HOME) " get all vimrcs until home directory and execute them from farthest from file to closest
    let dirs = []
    while(dir != $HOME)
      call add(dirs, dir)
      let dir = dir[0:strridx(dir, '/')-1] " chop off a directory
    endwhile
    let dirs = reverse(dirs)
    for d in dirs
      if(filereadable(d . '/' . g:dirrc_resource_name))
        call s:LoadOne(d)
      endif
    endfor
  elseif(filereadable(dir . '/' . g:dirrc_resource_name)) " if not in $HOME and if exists vimrc in this directory get it
    call s:LoadOne(dir)
  endif
endfunction

function s:LoadOne(dir)
  if(g:dirrc_security == 1)
    echo 'Load ' . a:dir . '/' . g:dirrc_resource_name . ' ? [y/n] '
    let s:ans = getchar()
    if(s:ans == 121)
      exec "so" a:dir . '/' . g:dirrc_resource_name
    endif
    unlet s:ans
  else
    exec "so" a:dir . '/' . g:dirrc_resource_name
  endif
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo

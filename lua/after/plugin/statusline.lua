local utils = {}

local scopes = { o = vim.o, b = vim.bo, w = vim.wo}


function utils.opt(scope, key, val)
  scopes[scope][key] = val
  if scope ~= 'o' then scopes['o'][key] = val end
end

vim.cmd[[
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
]]

local statusline = '%#CursorLineNr#'
statusline = statusline .. ' %y'
statusline = statusline .. ' %M'
statusline = statusline .. ' %r'
statusline = statusline .. ' %f'
statusline = statusline .. '%='
statusline = statusline .. '%#CursorLineNr#'
statusline = statusline .. ' %l/%L'
statusline = statusline .. ' %p%%'
statusline = statusline .. ' [%n]'
statusline = statusline .. ' %{StatuslineGit()}'
utils.opt('o', 'statusline', statusline)


setopt PROMPT_SUBST
autoload -U colors && colors

git_prompt_info() {
  local branch dirty remote
  local ahead=0
  local behind=0

  branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) || return

  if ! git diff --quiet --ignore-submodules 2>/dev/null ||
     ! git diff --quiet --cached --ignore-submodules 2>/dev/null; then
    dirty="⚡"
  fi

  read behind ahead <<< "$(git rev-list --left-right --count "@{upstream}...HEAD" 2>/dev/null)"

  ahead=${ahead:-0}
  behind=${behind:-0}

  if (( ahead > 0 && behind > 0 )); then
    remote="↕"
  elif (( ahead > 0 )); then
    remote="↑"
  elif (( behind > 0 )); then
    remote="↓"
  fi

  echo "%F{green}(${branch})%f%F{yellow}${remote}%f%F{red}${dirty}%f"
}

PROMPT='%F{white}%~%f $(git_prompt_info)
%F{white}❯%f '

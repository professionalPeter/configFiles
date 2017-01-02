# adapted from disambiguate-keeplast: http://mika.l3ib.org/code/zsh-functions/disambiguate-keeplast
function short_path {
  # short holds the result we want to print
  # full holds the full path up to the current segment
  # part holds the current segment, will get as few characters as
  # possible from cur, which is the full current segment

  local short full part cur
  local first
  local -a split    # the array we loop over

  # We do the (D) expansion right here and
  # handle it later if it had any effect
  split=(${(s:/:)${(Q)${(D)1:-$PWD}}})

  if [[ $split == "" ]]; then
    echo "/"
    return 0
  fi

  # Handling. Perhaps NOT use (D) above and check after shortening?
  if [[ $split[1] = \~* ]]; then
    # named directory we skip shortening the first element
    # and manually prepend the first element to the return value
    first=$split[1]
    # full should already contain the first
    # component since we don't start there
    full=$~split[1]
    shift split
  fi

  # we don't want to end up with something like ~/
  if (( $#split > 0 )); then
      part=/
  fi

  for cur ($split[1,-2]) {
    while {
             part+=$cur[1]
             cur=$cur[2,-1]
             local -a glob
             glob=( $full/$part*(-/N) )
             # continue adding if more than one directory matches or
             # the current string is . or ..
             # but stop if there are no more characters to add
             (( $#glob > 1 )) || [[ $part == (.|..) ]] && (( $#cur > 0 ))
          } { # this is a do-while loop
    }
    full+=$part$cur
    short+=$part
    part=/
  }
  echo "$first$short$part$split[-1]"
  return 0
}

function git_prompt_info {
  local ref=$(=git symbolic-ref HEAD 2> /dev/null)
  local gitst="$(=git status 2> /dev/null)"

  if [[ -f .git/MERGE_HEAD ]]; then
    if [[ ${gitst} =~ "unmerged" ]]; then
      gitstatus=" %{$fg[red]%}unmerged%{$reset_color%}"
    else
      gitstatus=" %{$fg[green]%}merged%{$reset_color%}"
    fi
  elif [[ ${gitst} =~ "Changes to be committed" ]]; then
    gitstatus=" %{$fg[blue]%}!%{$reset_color%}"
  elif [[ ${gitst} =~ "use \"git add" ]]; then
    gitstatus=" %{$fg[red]%}!%{$reset_color%}"
  elif [[ -n `git checkout HEAD 2> /dev/null | grep ahead` ]]; then
    gitstatus=" %{$fg[yellow]%}*%{$reset_color%}"
  else
    gitstatus=''
  fi

  if [[ -n $ref ]]; then
    echo "%{$fg_bold[green]%}/${ref#refs/heads/}%{$reset_color%}$gitstatus"
  fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "[%{$fg[green]%}%b%{$reset_color%}]%m%u%c%{$reset_color%} "
zstyle ':vcs_info:git*' actionformats "[%{$fg[green]%}%b%{$reset_color%}|%{$fg[red]%}(%a)%{$reset_color%}]%u%c%{$reset_color%} "
zstyle ':vcs_info:*:*' unstagedstr "%F{yellow}%B!%f%b"
zstyle ':vcs_info:*:*' stagedstr "%F{green}%B!%f%b"

#PROMPT='$(short_path)%<< $(git_prompt_info)${PR_BOLD_WHITE}>%{${reset_color}%} '
PROMPT='$(short_path) ${vcs_info_msg_0_}%B>%b '

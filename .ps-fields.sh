#####
# Developed by Luiz Felipe <felipe.silva337@yahoo.com>
# GitHub: https://github.com/Silva97/cli-tools
#
### Usage ###
# Source this script inside your .profile or .bashrc file:
# . ~/.ps-fields.sh
#
# You can set custom fields to be placed between git-view field and
# current directory field. Just set PSF array to commands to be executed:
#
# $ function example() { echo -ne "\x1b[95mExample field"; }
# $ PSF[0]="example"
#
# To delete a field, use `unset` instruction:
# $ unset PSF[0]
#
# To delete all fields, just use `unset` in the PSF array.
#####

function git-view() {
  local msg
  local branch=$(git branch 2>/dev/null)
  [ "$branch" == "" ] && return 0

  branch=$(grep "*" <<< "$branch"  | sed -E 's/\*\s+(\S+)/\1/')
  track=$(git status --porcelain   | grep -vE "^(\s|\?)" | wc -l)
  untrack=$(git status --porcelain | grep -E "^(\s|\?)"  | wc -l)

  case "$branch" in
    master)
      msg="\x1b[93m$branch"
      ;;
    *)
      msg="\x1b[96m$branch"
      ;;
  esac

  echo -ne "[$msg"

  [ $track -ne 0 ] && echo -ne " \x1b[92m$track"
  [ $untrack -ne 0 ] && echo -ne " \x1b[91m$untrack"

  echo -ne "\x1b[0;97m]─"
  return 0
}

function ps-fields() {
  [ ${#PSF} -eq 0 ] && return 0;

  for field in "${PSF[@]}"; do
    echo -ne "["
    echo -n $($field)
    echo -ne "\x1b[97m]─"
  done
}

export PS1="\[\e[97m\]┌─\`git-view\`"
export PS1+="\`ps-fields\`"
export PS1+="[\[\e[94m\]\w\[\e[97m\]]\[\e[0m\]\n"
export PS1+="\[\e[97m\]└─[\[\e[92m\]\u\[\e[97m\]]─\$ "
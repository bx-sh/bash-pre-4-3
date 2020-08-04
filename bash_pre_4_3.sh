_set_bash_pre_4_3() {
  local bash_major_version="${BASH_VERSION:0:1}"
  local bash_minor_version="${BASH_VERSION:2:1}"
  if [ $bash_major_version -lt 4 ]
  then
    export BASH_PRE_4_3=true
  elif [ $bash_major_version -eq 4 ] && [ $bash_minor_version -lt 3 ]
  then
    export BASH_PRE_4_3=true
  fi
}

_set_bash_pre_4_3

unset -f _set_bash_pre_4_3
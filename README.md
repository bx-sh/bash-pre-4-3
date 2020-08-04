# 🕰️ `$BASH_PRE_4_3`

For the love of Mac OS X.

---

The code:

```sh
_set_bash_pre_4_3() {
  local bash_major_version="${BASH_VERSION:0:1}"
  local bash_minor_version="${BASH_VERSION:2:1}"
  if [ $bash_major_version -lt 4 ]
  then
    export BASH_PRE_4_3=true
  elif [ $bash_major_version -eq 4 ] && [ $bash_minor_version -lt 3 ]
  then
    export BASH_PRE_4_3=true
  else
    :
  fi
}

_set_bash_pre_4_3

unset -f _set_bash_pre_4_3
```

### Why?

 - (a) Mac OS X uses a wicked old version of BASH (3.2.57) from ~2006
 - (b) There may arguably be other systems running BASH pre-4.3 (released in 2014)
 
BASH 4.3 introduced a significant feature: nameref variables

This allows you to have an indirect reference to another variable by its name:

```sh
# Create an array

declare -a myArray

local nameOfSomeArray="myArray"

# ...

# Somewhere else in the code, get an indirect reference to this array using its name

local array

typeset -n array="$nameOfSomeArray"

echo "Length: ${#array[@]}"
```

Other important features added after BASH 3.2.57 (which Mac OS X uses) include:

 - Associative arrays and the -z operator to check if they contain a certain key

---

I have lots of code that changes its behavior based on whether `[ -n "$BASH_PRE_4_3" ]` or not.

My code uses this as a package dependency, but you can use it however you'd like.

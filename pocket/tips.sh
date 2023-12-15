#!/bin/zsh
# -------------------------------------------------- #

# Remove all but one ( or more ) kind of filetype
# Reference https://unix.stackexchange.com/questions/102427/remove-all-but-one-or-more-kind-of-filetype
#           https://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/

# -------------------------------------------------- #

# Execute bash script from URL
# https://stackoverflow.com/questions/5735666/execute-bash-script-from-url

# -------------------------------------------------- #
# array as arguments
# Reference https://stackoverflow.com/questions/442012/in-zsh-how-do-i-pass-anonymous-arrays-into-functions
function i_want_array () {
    local array_name=$1

    echo "first array element is: " ${(P)${array_name}[1]}
}

local -a a=(one two three)
i_want_array "a"

# -------------------------------------------------- #
# associative array as arguments
# Reference https://stackoverflow.com/questions/68165452/zsh-return-associative-array-from-function
createAARR() {
    # Restrict $name to function scope.
    local name=$1

    # Delete $1, so $@ becomes the other args.
    shift

    # Assign elements to array. 
    set -A "$name" "$@"
}

typeset -A AARR=()
createAARR AARR k1 2 k2 4
typeset -p1 AARR
#echo ${(k)AARR}


# associative array as arguments
# Reference https://unix.stackexchange.com/questions/506440/pass-associative-array-as-parameter-list-to-script
to_param_list () {
    declare -n outlist=$1
    declare -n inhash=$2

    for param in "${!inhash[@]}"; do
        outlist+=( "--$param=${inhash[$param]}" )
    done
}
declare -A my_vars=( ["key1"]="value1" ["key2"]="value" )

to_param_list list my_vars
echo $list[*]

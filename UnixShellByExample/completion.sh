function _exp14() {
    COMPREPLY=()
    local cur=${COMP_WORDS[COMP_CWORD]};
    local com=${COMP_WORDS[COMP_CWORD-1]};
    case $com in
    'exp14.sh')
        COMPREPLY=($(compgen -W 'build_all compile update' -- $cur))
        ;;
    'compile')
        local pro=($(awk '{print $1}' datafile))
        COMPREPLY=($(compgen -W '${pro[@]}' -- $cur))
        ;;
    *)
        ;;
    esac
    return 0
}

complete -F _exp14 ./exp14.sh
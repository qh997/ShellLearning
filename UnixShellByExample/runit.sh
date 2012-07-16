#!/bin/bash

while getopts x:y:z options 2> /dev/null; do
    case $options in
        x)
            echo "-x is valid switch"
            echo "Option: $OPTARG"
            ;;
        y)
            echo "The argument for -y is $OPTARG"
            ;;
        z)
            echo "-z is valid switch"
            ;;
        \?)
            echo "Usage:runit -x -y filename ... "
            ;;
    esac
done

echo "The number of arguments passed was $(($OPTIND - 1))"
eval filename=\$$OPTIND
echo Filename = $filename

shift $(($OPTIND - 1))
echo $*
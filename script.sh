#!/bin/sh

touch temp

error() {
    printf '\033[91merror: \033[0m%s\n' "$1" >&2
    rm temp
    exit 1
}

if [ ! -v '1' -o ! -v '2' ]; then
    error "missing argument. expected ./script colorscheme template"
fi

theme="./themes/$1"

if [ ! -e $theme ]; then 
    error "$theme doesn't exist"
fi

template="./templates/$2.template"

if [ ! -e $template ]; then 
    error "$template doesn't exist"
fi


cat $template > temp

cat temp | sed "s/!name/$1/g" > temp2
mv temp2 temp

index=0

substitute() {
    cat temp | sed "s/!$index/$1/g" > temp2
    mv temp2 temp
}

for word in $(cat $theme); do
    if [ -z $(echo $word | grep -oE '^([0-9]|[a-f]){6}$') ]; then
        error "$word is not a valid hex code. the code's index is $index"
    fi
    substitute $word
    index=$(($index + 1))
done

if [ $index -ne 9 ]; then
    error "expected 9 codes but got $index" 
fi

output=$1_$2

mv temp $output

printf "\033[92msuccess: \033[0msaved theme to ./$output\n"

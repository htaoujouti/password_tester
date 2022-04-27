#!/bin/bash
if test $# -eq 0 ; then
    echo "give argument"
else
    case $1 in
        -t) len="$2"
            if test ${#len} -ge 8 ; then
                echo "$len" | grep -q [[:digit:]]
                if test $? -eq 0 ; then
                    echo "$len" | grep -q [[:alpha:]]
                    if test $? -eq 0 ; then 
                        echo "$len" | grep -q "[]:/?#@\!\ \$&'()*+,;=%[]"
                            if test $? -eq 0 ; then
                                input="./milw0rm-dictionary.txt"
                                while IFS= read -r line
                                do
                                    if [[ "$len" == "$line" ]] ; then
                                        echo "password easy to guess change it"
                                        exit
                                    fi
                                done < "$input"
                                echo "Strong password"
                            else
                                echo "weak password include special char"
                            fi
                    else
                        echo "weak password include char" 
                    fi
                else
                    echo "please include the numbers in password it is weak password"
                fi
            else
                echo "password lenght should be greater than or equal 8 hence weak password"
            fi 
        ;;
        -v) echo "Password Tester version 2.0.1 created by Hamza Taoujouti and Mouhib Trabelsi" 
        ;;
        -h) input="./help.txt"
            while IFS= read -r line
            do
                echo "$line"
            done < "$input"
    esac
fi
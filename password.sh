#!/bin/bash
show_usage () {
   echo "password.sh: [-h] [-v] [-m] [-g] [-N] [-t] password_to_test"
}
helps (){
    input="./help.txt"
            while IFS= read -r line
            do
                echo "$line"
            done < "$input"
}

test_password(){
    len=$1

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
}

fn_version(){
    echo "Password Tester version 2.0.1 created by Hamza Taoujouti and Mouhib Trabelsi"
}
while getopts ":hvt:m:g:" option;
do
  case $option in
        t) test_password $OPTARG
        ;;
        v)  fn_version
        ;;
        h) helps
        ;; 
        :) echo "Option -$OPTARG needs an argument"
        ;;
        *) show_usage
        ;;
    esac
done
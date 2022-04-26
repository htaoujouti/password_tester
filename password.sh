#!/bin/bash
if $# < 1; then
arg = "$1"
case arg in
    -t)   echo "enter the password"
    len="$2"
    if test $len -ge 8 ; then
        echo "$password" | grep -q [[:digit:]]
        if test $? -eq 0 ; then
            echo "$password" | grep -q [[:alpha:]]
            if test $? -eq 0 ; then                        
                echo "Strong password"                            
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
esac
else
    echo "give argument"
fi    
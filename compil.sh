#!/usr/bin/env bash

gcc -o crit_test machin.c -I$HOME/Criterion/include/criterion -Wl,-rpath=$HOME/Criterion/build/src -L$HOME/Criterion/build/src -W -Wall -Wextra -Werror -lcriterion

#-I$HOME/Criterion/include/criterion is so gcc know where to search the criterion.h file referenced by "#include <criterion.h>""
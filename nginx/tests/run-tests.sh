#!/bin/sh

script_dir=`dirname $0`
echo Changing working directory to $script_dir
cd "$script_dir"
echo

pass=0
fail=0
for script in test-*
do
    echo -n "$script ... "
    if ./silent.sh "./$script"
    then
        echo PASS
        ((pass++))
    else
        echo FAIL
        ((fail++))
    fi
    sleep 1  # just in case
done

total=$((pass + fail))
echo
echo Did run $total tests
echo $pass passes
echo $fail FAILURES


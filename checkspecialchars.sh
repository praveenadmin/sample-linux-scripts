#!/bin/bash

string_var="Bhaskar Reddy L"
if [[ $string_var =~ ^[[:alnum:]]+$ ]];then
 echo "String Contains alphabets and numbers"
else
 echo "String Contains special character"
fi


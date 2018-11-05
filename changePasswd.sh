#!/bin/bash
USER=(ifly)

for u in ${USER[*]}
do
PASSWORD="`</dev/urandom tr -dc '12345qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c16|awk -F "" '{sub(//,"_",$6); print}' |sed 's/ //g'`"
#echo "Changing the passwor of $USER "
echo $PASSWORD |passwd $USER --stdin
if [ $? == 0 ]
then
    echo "New password for $USER:$PASSWORD"
else
    echo "Fail to change the password!"
fi
done

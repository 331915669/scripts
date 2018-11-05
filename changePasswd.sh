#!/bin/bash
USER=(ifly)

for u in ${USER[*]}
do
PASSWORD="`</dev/urandom tr -dc '12345qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c16|awk -F "" '{sub(//,"_",$6); print}' |sed 's/ //g'`"
#echo "Changing the passwor of $USER "
echo $PASSWORD |passwd $u --stdin
if [ $? == 0 ]
then
    echo "New password for $u:$PASSWORD"
else
    echo "Fail to change the password!"
fi
done

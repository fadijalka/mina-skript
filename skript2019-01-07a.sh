!/bin/bash
username=$1
freq=$2

checkuser()
{
  if who grep "$1"
  then
  sleep 60
  fi
}

if [ -n "$1" ]
then
echo "Enter username"
read username
checkuser
echo -e "$1 is logged on \a"
echo -e "$1 logged in at `date`">>LOG
checkuser
else
echo "User is not logged on"
fi

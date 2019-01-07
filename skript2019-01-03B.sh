!/bin/bash
var=`sudo find /usr/share -size 1M`
sudo mkdir /home/backup/
sudo mkdir /home/arkiv/
touch wc.txt
echo $var > wc.txt
var2=`wc -w < wc.txt`
rm wc.txt
echo " "
if [ $var2 -gt 10000 ]
then
echo "WARNING!!! there are more then 10000files"
elif [ $var2 -gt 1000]
        then
        echo "WARNING!!! there are more then 1000files"

        elif [ $var2 -gt 100 ]
                then
                echo "WARNING!!! there are more then 100files"
                        elif [ $var2 -gt 10 ]
                        then
                        echo "WARNING!!! there are more then 10files"
                        else
                        echo "There are less then 10files"
                fi
echo " "
echo "There are $var2 files in /usr/share larger than 1Mbyte."
echo " "
while true; do
read -p "do you want to copy and compromize them to /home/backup?" yn
    case $yn in
        [Yy]* ) for i in $var ; do
                        file=${i##*/}
                        sudo cp $i /home/arkiv/$file ;
                done
                sudo tar -zcvf /home/backup/sharebackup.tar.gz /home/arkiv
; break;;
        [Nn]* ) exit;;
        * ) echo "Yes or No";;
esac
done

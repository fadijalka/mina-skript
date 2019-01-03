
if [ ! -d $1 ] ; then
	mkdir $1
fi

touch $2
mv $2 ./$1/$2

exec 10<&0
exec < $1

in=$1

file="current_line.txt"
let count=0

while read LINE
do 

	((count++))
	echo $LINE > $file
	if [ $? -ne 0]
	 then echo " error in writing file $(file); check its permission"
fi
done

echo "number of lines : $count"
echo "expected number of lines: 'wc -l $in'"

exec 0<&10 10<$-

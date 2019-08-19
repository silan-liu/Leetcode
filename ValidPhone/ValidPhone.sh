# 读取 file.txt
while read line
do
    echo $line | egrep '^(\d{3}-|\(\d{3}\)\s)\d{3}-\d{4}$'
done < file.txt

egrep '^(\d{3}-|\(\d{3}\)\s)\d{3}-\d{4}$' file.txt
